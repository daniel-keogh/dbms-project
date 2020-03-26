<?php
	//Send utf-8 header before any output
	header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Patient Referrals</title>
	</head>	
	<body>
		<table border="1">		
			<tr>
				<td><h2>name</h2></td>
				<td><h2>appointment_date</h2></td>
				<td><h2>specialist_name</h2></td>
				<td><h2>specialty</h2></td>
				<td><h2>xray</h2></td>
                <td><h2>xray_path</h2></td>
			</tr>
			<?php			
				$host = "localhost";
				$user = "root";
				$password = "";
				$database = "mulcahy_dental";
				
                $query = "SELECT p.name, a.date AS appointment_date, s.name specialist_name, s.specialty, t.xray, t.xray_path 
                    FROM appointment a 
                    JOIN patient p USING(patient_id) 
                    JOIN treatment t USING(appointment_id) 
                    JOIN specialist s ON t.referral = s.specialist_id";
                
                //Connect to the database
				$connect = mysqli_connect($host, $user, $password, $database) or die("Problem connecting.");
                
                //Set connection to UTF-8
				mysqli_query($connect, "SET NAMES utf8");
                
                //Select data
				$result = mysqli_query($connect, $query) or die("Bad Query.");
                
                mysqli_close($connect);

				while($row = $result->fetch_array())
				{
					echo "<tr>";
					echo "<td><h2>" .$row['name'] . "</h2></td>";
					echo "<td><h2>" .$row['appointment_date'] . "</h2></td>";
					echo "<td><h2>" .$row['specialist_name'] . "</h2></td>";
					echo "<td><h2>" .$row['specialty'] . "</h2></td>";
                    echo "<td><h2>" .$row['xray'] . "</h2></td>";
                    echo "<td><h2>" .$row['xray_path'] . "</h2></td>";
				    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>