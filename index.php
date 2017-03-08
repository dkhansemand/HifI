<?php
    ##Include header (With navigation)
    include './partials/header.php';

    //$slide = array(0 => array('sliderId' => 1, 'sliderHeading' => 'Test slider', 'sliderImg' => 'slide1.jpg'), 1 => array('sliderId' => 2, 'sliderHeading' => 'Test slider 2', 'sliderImg' => 'slide2.jpg'));

    include './partials/slider.php';
?>

   

    <section class="container heading">
        <article class="row">
        	<section class="col-lg-12">
        		<h3>Velkommen</h3>
        	</section>
        </article>
        <hr class="featurette-divider">
        
        <?php include './partials/mainContent.php'; ?>

        <hr class="featurette-divider">
        <article>
            <section class="row">
                <?php include './partials/news.php'; ?>
            </section>
        </article>
        <hr class="featurette-divider">
        <?php
            ##Include footer
            include './partials/footer.php';
