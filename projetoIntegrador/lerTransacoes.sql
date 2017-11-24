USE amphora;
WITH transacoes as
(
	SELECT almoxarifado.nome as almoxarifado, transacao.*
    FROM transacao INNER JOIN almoxarifado
    ON almoxarifado.idalmoxarifado = transacao.idalmoxarifado
)
, itemalmox as 
(
	SELECT item.idalmoxarifado, item.info as nome, item.iditem as iditem FROM item INNER JOIN transacoes
    ON item.idalmoxarifado = transacoes.idalmoxarifado AND item.iditem = transacoes.iditem
)
, transacaodepurada as
(
	SELECT transacoes.idalmoxarifado,transacoes.iditem as transacaoiditem, transacoes.almoxarifado as almoxarifado, usuario.nome, transacoes.data_solicitada, transacoes.quantidade_entregue, transacoes.devolvida, transacoes.data_devolvida
	FROM usuario INNER JOIN transacoes ON usuario.idusuario = transacoes.idusuario AND usuario.idalmoxarifado = transacoes.idalmoxarifado AND transacoes.entregue=1
)
SELECT itemalmox.nome, transacaodepurada.almoxarifado as almoxarifado, transacaodepurada.nome as autor, transacaodepurada.data_solicitada, transacaodepurada.quantidade_entregue, transacaodepurada.devolvida, transacaodepurada.data_devolvida FROM transacaodepurada INNER JOIN itemalmox ON itemalmox.iditem = transacaodepurada.transacaoiditem AND itemalmox.idalmoxarifado = transacaodepurada.idalmoxarifado;

