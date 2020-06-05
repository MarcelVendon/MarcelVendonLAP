<?php 
    include('dataaccess/dataaccess.php');
    include('models/bike.php');
    $bikes = null;

    if(isset($_POST["startsearch"])){
        //Bei leerer Suche werden alle bikes ausgegeben
        $bikes = SearchBikes($_POST["search"]);
    }
    else{
        $bikes = SearchBikes('');
    }
    
    include_once('./header.php') ?>

        <br>
        <h1 class="h1">Bikes</h1>
        <br><br><br>


        <form class="container" method="POST">
            <div class="row">
                <label for="search" class="label h5">Search Bikes:</label>
            </div>
            <div class="row">
                <input type="text" id="search" name="search" class="form-control">
            </div>
            <br>
            <div class="row">
                <input type="submit" name="startsearch" id="startsearch" class="btn-primary form-control">
            </div>
        </form>

        <table class="table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Bike</th>
                </tr>
            </thead>
            <tbody>
            <?php 
                if($bikes != null){
                    foreach($bikes as $bike){
                        echo '<tr>';
                        echo '<td>'.$bike->id.'</td><td>'.$bike->name.'</td>';
                        echo '</tr>';
                    }
                }
            ?>
            </tbody>
        </table>
    </body>
</html>
