<form action="AddRatingServlet" method="get">
    <div class="one_third first">
        <label for="name">Puntuacion<span>*</span></label>
        <input type="number" name="rating" id="name" min="1" max="5" value="" size="22" required>
    </div>
    <div class="block clear">
        <label for="comment">Tu comentario</label>
        <textarea name="comment" id="comment" cols="25" rows="10"></textarea>
    </div>
   	<input type = "hidden" name = "isbn" value = "${book.getIsbn()}" /> 
    <div>
        <input type="submit" name="submit" value="Enviar">
        &nbsp;
        <input type="reset" name="reset" value="Borrar">
    </div>
</form>