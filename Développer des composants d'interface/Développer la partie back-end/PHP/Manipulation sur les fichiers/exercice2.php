<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Utilisateurs</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
<table class="table table-striped centered">
        <thead>
                <tr>
                        <th>Firstname</th>
                        <th>Surname</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>City</th>
                        <th>State</th>
                </tr>
        </thead>
        <tbody>
                <tr>
                <?php
                $lines = file("http://bienvu.net/misc/customers.csv");
                foreach ($lines as $value) {
                        $array = explode(",", $value);
                        foreach ($array as $value) { ?>
                        <td>
                        <?= $value ?>
                        </td>
                        <?php
                        }
                        ?>
                </tr>
                <?php
                }
                ?>
        </tbody>
</table>

</body>
</html>

