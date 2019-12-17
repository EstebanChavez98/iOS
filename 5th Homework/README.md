# Tarea 5

Realiza el siguiente CRUD en swift, siguiendo el ejemplo de clase. Usar sqlite como respaldo principal.

Sera un catalogo de cosas que deseas comprar (Wish List). Realiza las 4 operaciones de CRUD.
Debe te contener los siguientes campos:

 * Nombre del producto que quiero comprar (texto)
 * Tienda en la que quiero comprarlo o pagina web (texto).
 * Costo aproximado. (Decimal)
 * QueTanNescesario, usar la escala del 1 al 5. 1 siendo un gusto , 5 siendo un producto esencial.  (Numerico o dropdown)
 * Explicación (Texto) Razones por las cuales quiero comprar este producto. 

El listview debe de estar ordenado por necesidad y luego por nombre. Es decir primero deben de aparecer los artículos necesarios y luego los menos necesarios.  Dentro de cada categoría deben de estar ordenados por costo, los mas caros primero. 

 * Usaras SQLite para guardar toda la información recaudada. 
 * Podrás crear una nuevo producto
 * Podrás editar cualquier campo excepto el nombre del producto.
 * Podrás borrar el producto.

