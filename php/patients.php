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
		<table border="1">		
			<tr>
				<td><h2>id</h2></td>
				<td><h2>name</h2></td>
				<td><h2>dob</h2></td>
				<td><h2>phone_no</h2></td>
				<td><h2>email</h2></td>
			</tr>
			<?php			
				$host = "localhost";
				$user = "root";
				$password = "";
				$database = "mulcahy_dental";
				
				$query = "SELECT * FROM patient";
                
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
					echo "<td><h2>" .$row['patient_id'] . "</h2></td>";
					echo "<td><h2>" .$row['name'] . "</h2></td>";
					echo "<td><h2>" .$row['dob'] . "</h2></td>";
					echo "<td><h2>" .$row['phone_no'] . "</h2></td>";
					echo "<td><h2>" .$row['email'] . "</h2></td>";
				    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>