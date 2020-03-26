<?php
	//Send utf-8 header before any output
	header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Appointments</title>
	</head>	
	<body>
        <table border="1">		
			<tr>
				<td><h2>appointment_id</h2></td>
				<td><h2>name</h2></td>
				<td><h2>date</h2></td>
				<td><h2>phone_no</h2></td>
				<td><h2>email</h2></td>
                <td><h2>amount_owed</h2></td>
                <td><h2>last_update</h2></td>
			</tr>
            <?php
                $host = "localhost";
                $user = "root";
                $password = "";
                $database = "mulcahy_dental";

                $connect = mysqli_connect($host, $user, $password, $database) or die("Problem connecting.");

                $query = "SELECT appointment_id, name 'patient_name', date, phone_no, email, amount_owed, last_update 
                    FROM appointment JOIN patient USING(patient_id) 
                    WHERE cancelled = '0' 
                    ORDER BY date";

                $result = mysqli_query($connect, $query) or die("Bad Query.");
                    
                while($row = $result->fetch_array())
                {		
                    echo "<tr>";
                    echo "<td><h2>" .$row['appointment_id'] . "</h2></td>";
                    echo "<td><h2>" .$row['name'] . "</h2></td>";
                    echo "<td><h2>" .$row['date'] . "</h2></td>";
                    echo "<td><h2>" .$row['phone_no'] . "</h2></td>";
                    echo "<td><h2>" .$row['email'] . "</h2></td>";
                    echo "<td><h2>" .$row['amount_owed'] . "</h2></td>";
                    echo "<td><h2>" .$row['last_update'] . "</h2></td>";
                    echo "</tr>";
                }
            ?>
        </table>
    </body>
</html>