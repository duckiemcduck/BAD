USE amphora;
WITH produtos as
(
	SELECT item.idalmoxarifado as idalmoxarifado, item.info,item.quantidade,categorias.descricao as categoria 
    FROM item INNER JOIN categorias 
    ON item.idalmoxarifado=1 AND item.idcategoria=categorias.idcategoria AND item.idalmoxarifado=categorias.idalmoxarifado
)
SELECT almoxarifado.nome as almoxarifado, produtos.info, produtos.quantidade, produtos.categoria
FROM almoxarifado INNER JOIN produtos ON almoxarifado.idalmoxarifado = produtos.idalmoxarifado;