


<form id="logingform" action="./login" method="get">
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Cerrar</span></button>
                    <h4 class="modal-title" id="myModalLabel">Login</h4>
                </div>

                <div class="modal-body">
                    <div class="form-group has-feedback">
                        <label class="control-label">Usuario</label>
                        <input type="text" class="form-control" id="username" name="username"
                               aria-describedby="inputSuccess2Status" placeholder="Usuario">
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <label class="control-label">Contrasena</label>
                        <input type="password" class="form-control" id="password" name="password"
                 
                               aria-describedby="inputSuccess2Status" placeholder="Contrasena">
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                    </div>

	
                    <button class="btn btn-primary" type="submit"> Acceder</button>
                    <input type="checkbox" value="rememberme" id="rememberme"
                           style="display: inline; margin-left: 300px;"> Recordarme<br/><br/>

                    <a href="#">¿Olvidaste la contraseña?</a>

                </div>

                <div class="modal-footer">
                    <h4 class="modal-title" id="myModalLabel">Crear cuenta</h4>
                    Si no eres miembro todavía<a data-toggle="modal" data-target="#signup" data-dismiss="modal">
                    regístrate aquí</a>
                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>-->
                </div>

                <div class="logmod__alter">
                    <div class="logmod__alter-container">
                        <a href="#" class="connect facebook">
                            <div class="connect__icon">
                                <i class="fa fa-facebook"></i>
                            </div>
                            <div class="connect__context">
                                <span>Acceder con <strong>Facebook</strong></span>
                            </div>
                        </a>

                        <a href="#" class="connect googleplus">
                            <div class="connect__icon">
                                <i class="fa fa-google"></i>
                            </div>
                            <div class="connect__context">
                                <span>Acceder con <strong>Google</strong></span>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div><!-- end become a member modal -->
</form> <!-- end login form -->