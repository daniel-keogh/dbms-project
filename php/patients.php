<?php
	//Send utf-8 header before any output
	header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Patients Table</title>
	</head>	
	<body>
		<h3>Patients</h3>
		<br/>

		<table border="1">		
			<tr>
				<td><h3>id</h3></td>
				<td><h3>name</h3></td>
				<td><h3>dob</h3></td>
				<td><h3>phone_no</h3></td>
				<td><h3>email</h3></td>
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
                
                //Connect to the database
				$connect = mysqli_connect($host, $user, $password, $database) or die("Problem connecting.");
                
                //Set connection to UTF-8
				mysqli_query($connect, "SET NAMES utf8");
			
				$query = "SELECT * FROM patient";

                //Select data
				$result = mysqli_query($connect, $query) or die("Bad Query.");
                
                mysqli_close($connect);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h3>" .$row['patient_id'] . "</h3></td>";
					echo "<td><h3>" .$row['name'] . "</h3></td>";
					echo "<td><h3>" .$row['dob'] . "</h3></td>";
					echo "<td><h3>" .$row['phone_no'] . "</h3></td>";
					echo "<td><h3>" .$row['email'] . "</h3></td>";
				    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>