<form class="form-horizontal" method="get" action="AdvancedSearchServlet" accept-charset="utf-8">
    <div>
        <label class="control-label" for="BusquedasTitulo">Título</label>
        <div class="controls">
            <input name="titulo" type="text" value="" id="BusquedasTitulo" size="32">
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="BusquedasAutor">Autor</label>
        <div class="controls">
            <input name="autor" type="text" value="" id="BusquedasAutor" size="32">
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="BusquedasIsbn">ISBN</label>
        <div class="controls">
            <input name="isbn" type="text" value="" id="BusquedasIsbn" size="32">
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="BusquedasEditorial">Editorial</label>
        <div class="controls">
            <input name="editorial" type="text" value="" id="BusquedasEditorial" size="32">
        </div>
    </div>

    <div class="control-group">
        <br>
        <div class="controls">
            <input class="btn" type="submit" value="Enviar">
        </div>
    </div>
</form>