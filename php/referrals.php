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
		<h3>Patient Referrals</h3>
		<br/>

		<table border="1">		
			<tr>
				<td><h3>patient_name</h3></td>
				<td><h3>appointment_date</h3></td>
				<td><h3>specialist_name</h3></td>
				<td><h3>specialty</h3></td>
				<td><h3>xray</h3></td>
                <td><h3>xray_path</h3></td>
			</tr>
			<?php			
				// Local
				$host = "localhost";
				$user = "root";
				$password = "";

				// Remote
				// $host = "CLOUD_IP";
				// $user = "DK";
				// $password = "DK";

				$database = "mulcahy_dental";
				
                $query = "SELECT p.name patient_name, a.date AS appointment_date, s.name specialist_name, s.specialty, t.xray, t.xray_path, t.treatment_id
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
					echo "<td><h3>" .$row['patient_name'] . "</h3></td>";
					echo "<td><h3>" .$row['appointment_date'] . "</h3></td>";
					echo "<td><h3>" .$row['specialist_name'] . "</h3></td>";
					echo "<td><h3>" .$row['specialty'] . "</h3></td>";
					echo "<td><h3><img src=image_blobs.php?treatment_id=".$row['treatment_id']." width=200 height=150/></h3></td>";
					echo "<td><h3><img src=http://".$host.$row['xray_path'] . " width=200 height=150/></h3></td>";
				    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>