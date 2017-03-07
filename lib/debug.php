<?php

    ## Debug of MySQL connection, only if set in URL [DEBUG]
    if(isset($_GET['DEBUG'])){
        ?>
        <div class="panel panel-default">
            <div class="panel-heading">DEBUG panel</div>
                <div class="panel-body">
                    <div class="alert alert-warning" role="alert">
                        <?=$conn->testConnection();?>
                    </div>
                </div>
            </div>   
        </div>     
        <?php
    }

