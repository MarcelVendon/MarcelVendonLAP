<?php 
    include_once('./header.php');
    include('dataaccess/dataaccess.php');
    include('models/bike.php');
    include('models/person.php');
    include('models/rented.php');

    $bikes = SearchBikes('');
    $persons = GetPersons();

    if(isset($_POST["end"])){
        $_POST = null;
    }

    if(isset($_POST["anlegen"])){
        $rentbike = new rented();
        $rentbike->dateFrom = $_POST["date"] . ' ' . '00:00:00';
        $rentbike->dateTo = $_POST["dateto"] . ' ' . '00:00:00';
        $rentbike->personId = $_POST["person"];
        $rentbike->bikeId = $_POST["bike"];


        $id = NewRented($rentbike);
        echo '<b>' . $id . '</b>';
        //$res = GetKurstermin($id);
        ?>

        <!--    
        <table class="table">
            <thead>
                <tr>
                    <th>Kurs</th>
                    <th>Termin</th>
                    <th>Raum</th>
                </tr>
            </thead>
            <tbody>
            <?php 
            
                if($res != null){
                    echo '<tr>';
                    echo '<td>'.$res->kursname.'</td><td>'.$res->terminbeginn.'</td><td>'.$res->raumbezeichnung.'</td>';
                    echo '</tr>';
                    
                }
            ?>
            </tbody>
        </table> 
        -->
        <form method="POST"><input type="submit" name="end" class="form-control btn-primary"></form>
        <?php
    }
    else{

    
?>

        <br>
        <h1 class="h1">Make Reservation</h1>
        <br><br><br>

        <form class="container" method="POST">
            <div class="row">
                <label for="bike" class="label h5">Bike:</label>
            </div>
            <div class="row">
                <select id="bike" name="bike" class="form-control" required>
                    <?php
                    if($bikes != null){
                        foreach($bikes as $bike){
                            echo '<option value="'.$bike->id.'">'.$bike->name.'</option>';
                        }
                    }
                    ?>
                </select>
            </div>
            <br>
            <div class="row">
                <label for="person" class="label h5">Person:</label>
            </div>
            <div class="row">
                <select id="person" name="person" class="form-control" required>
                    <?php
                    if($persons != null){
                        foreach($persons as $person){
                            echo '<option value="'.$person->id.'">'.$person->name.'</option>';
                        }
                    }
                    ?>
                </select>
            </div>
            <br>
            <div class="row">
                <label for="date" class="label h5">From:</label>
            </div>
            <div class="row">
                <input type="date" name="date" id="date" class="form-control" required>
            </div>
            <br>
            <div class="row">
                <label for="dateto" class="label h5">To:</label>
            </div>
            <div class="row">
                <input type="date" name="dateto" id="dateto" class="form-control" required>
            </div>
            <br>
            <div class="row">
                <input type="submit" name="anlegen" id="anlegen" class="btn-primary form-control" value="Neuen Termin anlegen">
            </div>
        </form>
    </body>
</html>
<?php } ?>