<?php
    ##Include header (With navigation)
    include './partials/header.php';
?>
    <section class="container heading">
        <article class="row">
        	<section class="col-lg-12">
        		<h3>Kontakt</h3>
        	</section>
        </article>
        <hr class="featurette-divider">
        <article class="row">
            <section class="col-md-12">
                <div class="jumbotron jumbotron-sm">
                    <h1><small>Du er velkommen til at kontakte os</small></h1>
                </div>
                <div class="col-md-8">
                    <div class="well well-sm">
                        <form>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name">Navn</label>
                                    <input type="text" class="form-control" id="name" placeholder="Indtast navn" required="required" />
                                </div>
                                <div class="form-group">
                                    <label for="email">Email Adresse</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                        </span>
                                        <input type="email" class="form-control" id="email" placeholder="Indtast email" required="required" /></div>
                                </div>
                                <div class="form-group">
                                    <label for="subject">Emne</label>
                                    <input type="text" class="form-control" id="name" placeholder="Indtast emne" required="required" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name">Besked</label>
                                    <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required" placeholder="Besked"></textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary pull-right" id="btnContactUs">Send Besked</button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4">
                    <form>
                    <legend><span class="glyphicon glyphicon-globe"></span> Vores adresse</legend>
                    <address>
                        <strong>Hi-fi Netbutikken</strong><br>
                        Byvej 25<br>
                        4000 bykøbing<br>
                        <abbr title="Telefon">Tlf:</abbr> 45 45 45 45<br>
                        <abbr title="Fax">Fax:</abbr> 45 45 45 45<br>
                    </address>
                    <address>
                        post@hifi-netbutikken.dk
                    </address>
                    </form>
                </div>
            </section>
        </article>
        <hr class="featurette-divider">

<?php
    ##Include footer
    include './partials/footer.php';
