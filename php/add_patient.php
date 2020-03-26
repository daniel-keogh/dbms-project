<?php
	//Send utf-8 header before any output
	header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Add Patient</title>
	</head>	
	<body>
        <h3>Add a Patient</h3>
        <br/>

        <form action="" method="POST">
            <label>Name</label>
            <input required type="text" name="name" />
            <br/><br/>

            <label>Date of Birth</label>
            <input required type="date" name="dob" />
            <br/><br/>

            <label>Phone Number</label>
            <input required type="number" name="phone" />
            <br/><br/>

            <label>Email</label>
            <input required type="email" name="email" />

            <br/><br/>
            <button name="submit">Submit</button>
            <br/><br/>
        </form>
        <?php
            $host = "localhost";
            $user = "root";
            $password = "";
            $database = "mulcahy_dental";

            $connect = mysqli_connect($host, $user, $password, $database) or die("Problem connecting.");

            if (isset($_POST['submit'])) {
                $name = $_POST['name'];
                $dob = $_POST['dob'];
                $phone = $_POST['phone'];
                $email = $_POST['email'];
    
                $query = "INSERT INTO patient (name, dob, phone_no, email) 
                    VALUES ('$name', '$dob', '$phone', '$email')";
    
                mysqli_query($connect, $query) or die (mysqli_error($connect)); 

                echo "Form submitted.";
                mysqli_close($connect);

                header('Location: ./patients.php');
            }
        ?>
    </body>
</html>