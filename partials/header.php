<?php
    ## Require needed libaries
    require_once './lib/class.mysql.php';

    ## Open connection to Database
    $conn = new dbconnector();

    ## Only included in development
    require_once './lib/debug.php';

?>
<html>

<head>
    <meta charset="utf-8">
    <title>HIFI - Velkommen</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/mystyle.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
<header>
	<div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a href="index.php" class="navbar-brand">HIFI</a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <nav class="navbar-collapse collapse" id="navbar-main">
          <ul class="nav navbar-nav">
            <li><a href="index.php">Forside</a></li>
            <?php
              ## Get all categories and list in menu
              $query = $conn->newQuery("SELECT id, categoryName FROM hifi_category WHERE isActive = 1 ORDER BY id ASC;");
              ## Check if the statement can be executed
              if($query->execute()){
                ## Loop through results and in format ASSOC
                while ($categories = $query->fetch(PDO::FETCH_ASSOC)){
                    ?>
                      <li><a href="products.php?catID=<?=$categories['id']?>"><?=utf8_encode($categories['categoryName'])?></a></li>
                    <?php
                }
              }

            ?>
           
            <li><a href="kontakt.php">Kontakt</a></li>
        </nav>
      </div>
    </div>
</header>