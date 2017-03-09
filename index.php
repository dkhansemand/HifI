<?php
    ## Include header (With navigation)
    include './partials/header.php';

    ## Include ImageSlider from partials
    include './partials/slider.php';
?>
<section class="container heading">
    <article class="row">
        <section class="col-lg-12">
            <h3>Velkommen</h3>
        </section>
    </article>
    <hr class="featurette-divider">
    
    <?php include './partials/mainContent.php'; ## Include main content from partials?>

    <hr class="featurette-divider">
    <article>
        <section class="row">
            <?php include './partials/news.php'; ## Include News from partials ?>
        </section>
    </article>
    <hr class="featurette-divider">
    <?php
        ##Include footer
        include './partials/footer.php';
