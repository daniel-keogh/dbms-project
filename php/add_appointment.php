<?php
	//Send utf-8 header before any output
	header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Add Appointment</title>
	</head>	
	<body>
        <h3>Add an Appointment</h3>
        <br/>
        <form action="" method="POST">
            <label>Patient ID</label>
            <input required type="number" name="pid" />
            <br/><br/>

            <label for="date">Appointment Date</label>
            <input required type="date" name="date" />
            <br/><br/>

            <label>Appointment Time</label>
            <input required type="time" name="time" />
            <br/><br/>

            <label>Booking Method</label>
            <select name="booking">
                <option value="phone">Phone</option>
                <option value="post">Post</option>
                <option value="drop-in">Drop-In</option>
                <option value="follow-up">Follow-Up</option>
            </select>

            <br/><br/>
            <button name="submit">Submit</button>
            <br/><br/>
        </form>

        <table border="1">		
			<tr>
				<td><h2>appointment_id</h2></td>
				<td><h2>patient_id</h2></td>
				<td><h2>date</h2></td>
				<td><h2>booking_method</h2></td>
				<td><h2>cancelled</h2></td>
			</tr>
            <?php
                $host = "localhost";
                $user = "root";
                $password = "";
                $database = "mulcahy_dental";

                $connect = mysqli_connect($host, $user, $password, $database) or die("Problem connecting.");

                $query = "SELECT * FROM appointment";

                $result = mysqli_query($connect, $query) or die("Bad Query.");
                    
                while($row = $result->fetch_array())
                {		
                    echo "<tr>";
                    echo "<td><h2>" .$row['appointment_id'] . "</h2></td>";
                    echo "<td><h2>" .$row['patient_id'] . "</h2></td>";
                    echo "<td><h2>" .$row['date'] . "</h2></td>";
                    echo "<td><h2>" .$row['booking_method'] . "</h2></td>";
                    echo "<td><h2>" .$row['cancelled'] . "</h2></td>";
                    echo "</tr>";
                }
            ?>
        <?php
            if (isset($_POST['submit'])) {    
                $pid = $_POST['pid'];
                $date = $_POST['date'];
                $time = $_POST['time'];
                $booking = $_POST['booking'];
    
                $query = "INSERT INTO appointment (patient_id, date, booking_method) 
                    VALUES ('$pid', CONCAT('$date', ' ', '$time'), '$booking')";
    
                mysqli_query($connect, $query) or die (mysqli_error($connect)); 

                echo "Form submitted.";
                mysqli_close($connect);
            }
        ?>
    </body>
</html>