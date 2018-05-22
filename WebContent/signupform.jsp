<!-- Modal Become a member -->
<form action="signup" method="post"  enctype="multipart/form-data" id="newmember">
    <div class="modal fade" id="signup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span
                            class="sr-only">Cerrar</span></button>
                    <h4 class="modal-title" id="myModalLabel">Crear cuenta</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group has-feedback">
                        <label class="control-label" for="firstnameinput">Nombre de Usuario</label>
                        <input type="text" class="form-control" id="username" aria-describedby="firstnameinput"
                               required="" name="username">
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <label class="control-label" for="emailinput">Email</label>
                        <input type="email" class="form-control" id="emailinput" aria-describedby="emailinput"
                               required="" name="email">
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                    </div>
                    
                   <div class="form-group has-feedback">
                        <label class="control-label" for="fileinput">Foto de perfil</label>
                        <input type="file" class="form-control" id="fileinput" aria-describedby="fileinput"
                               required="" name="profilepic">
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                    </div>
                    
                    <div class="form-group has-feedback">
                        <label class="control-label" for="adressinput">Direccion</label>
                        <input type="text" class="form-control" id="adressinput	" aria-describedby="roleimput"
                               required="" name="address">
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                    </div>
                    
                     <div class="form-group has-feedback">
                        <label class="control-label" for="emailinput">Role</label>
                       	<select name="role">
						    <option value="lector">lector</option>
						    <option value="editorial">editorial</option>
						  </select>
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <label class="control-label" for="passwordinput">Contrasena</label>
                        <input type="password" class="form-control" id="passwordinput" aria-describedby="passwordinput"
                               required="" name="password">
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                    </div>	
  					
                    <button class="btn btn-primary" type="submit"> Crear Cuenta</button>


                </div><!-- end modal-Body -->

                <div class="logmod__alter">
                    <div class="logmod__alter-container">
                        <a href="#" class="connect facebook">
                            <div class="connect__icon">
                                <i class="fa fa-facebook"></i>
                            </div>
                            <div class="connect__context">
                                <span>Crear cuenta con <strong>Facebook</strong></span>
                            </div>
                        </a>

                        <a href="#" class="connect googleplus">
                            <div class="connect__icon">
                                <i class="fa fa-google"></i>
                            </div>
                            <div class="connect__context">
                                <span>Crear cuenta con <strong>Google</strong></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- end become a member modal -->
</form> <!-- end Form -->