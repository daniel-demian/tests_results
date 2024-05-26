<?php

$dsn = "mysql:host=localhost;dbname=test_plugin";
$dbusername = "root";
$dbpassword = "";

try {
    $pdo = new PDO($dsn, $dbusername, $dbpassword);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

try {
    $query = "SELECT * 
                FROM otestuj_tests
                INNER JOIN 
                    otestuj_test_attempt ON otestuj_tests.id = otestuj_test_attempt.test_id
                INNER JOIN 
                    otestuj_test_attempt_question ON otestuj_test_attempt.id = otestuj_test_attempt_question.attempt_id;";

    $stmt = $pdo->prepare($query);
    $stmt->execute();
    $results = $stmt->fetchAll();

    $pdo = null;
    $stmt = null;
} catch (PDOException $e) {
    die("Query failed: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Tests</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
</head>

<body>
    <div class="gradient-custom-1 h-100">
        <div class="mask d-flex align-items-center h-100">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="table-responsive bg-white">
                            <table class="table mb-0">
                                <thead>
                                    <tr>
                                        <th>Test Name</th>
                                        <th>User ID</th>
                                        <th>Test Start</th>
                                        <th>Test End</th>
                                        <th>Score</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $previous_attempt_id = null;
                                    foreach ($results as $row) :
                                        if ($row['attempt_id'] != $previous_attempt_id) :
                                            $testStart = (new DateTime($row['test_start']))->format('d.m.Y H:i:s');
                                            $testEnd = (new DateTime($row['test_end']))->format('d.m.Y H:i:s');
                                    ?>

                                            <tr onclick="toggleModal(<?= $row['attempt_id'] ?>)">
                                                <td><?= htmlspecialchars($row['name']) ?></td>
                                                <td class="user-id" data-attempt-id="<?= $row['attempt_id'] ?>"><?= htmlspecialchars($row['user_id']) ?></td>
                                                <td><?= htmlspecialchars($testStart) ?></td>
                                                <td><?= htmlspecialchars($testEnd) ?></td>
                                                <td class="score" data-attempt-id="<?= $row['attempt_id'] ?>" style="color: <?= $row['test_result'] >= 90 ? 'green' : 'inherit' ?>;">
                                                    <?= htmlspecialchars($row['test_result']) ?>
                                                </td>
                                            </tr>
                                        <?php endif; ?>
                                        <div class="questions" data-attempt-id="<?= $row['attempt_id'] ?>" style="display: none;">
                                            <p><?= htmlspecialchars($row['user_id']) . " " . htmlspecialchars($row['test_result']) ?></p>
                                            <span class="question-number"><?= htmlspecialchars($row['question_number']) ?></span>
                                            <span class="correct-answer"><?= htmlspecialchars($row['correct_answers']) ?></span>
                                            <span class="user-answer"><?= htmlspecialchars($row['user_answers']) ?></span>
                                        </div>
                                        <?php $previous_attempt_id = $row['attempt_id']; ?>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="questionsModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <div id="modalContent"></div>
        </div>
    </div>
</body>

</html>