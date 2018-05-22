<form id="newbook" action="newBookServlet" method="post" enctype="multipart/form-data">
    <label for="title">Título <span>*</span></label>
    <input type="text" name="title" id="title" value="" size="44" required>


    <label for="autor">Autor <span>*</span></label>
    <input type="text" name="autor" id="autor" value="" size="44" required>


    <label for="editorial">Editorial <span>*</span></label>
    <input type="text" name="editorial" id="editorial" value="" size="44" required>


    <label for="isbn">ISBN <span>*</span></label>
    <input type="text" name="isbn" id="isbn" value="" size="22" required>


    <label for="date">Fecha de publicación </label>
    <input type="date" name="date" id="date" placeholder="En formato dd/mm/aa" value="" size="22">

    <label for="isbn">Portada <span>*</span></label>
    <input type="file" name="cover" id="cover" value="" placeholder="portada.jpg" size="40" required>


    <label for="format">Formato <span>*</span></label>
    <input type="text" name="format" id="format" value=""
           placeholder="tapa blanda/tapa dura;" size="44" required>
    <label for="category">Categoría <span>*</span></label>
    <input type="text" name="category" id="category" value=""
           placeholder="ficcion/no ficcion;" size="44" required>

    <div class="block clear">
        <label for="comment">Reseña <span>*</span></label>
        <textarea name="comment" id="comment" cols="64" rows="15" required></textarea>
    </div>
    <div>
        <input type="submit" name="submit" value="Guardar" style="display: inline">
        &nbsp;
        <input type="reset" name="reset" value="Borrar" style="display: inline;">

    </div>

</form>