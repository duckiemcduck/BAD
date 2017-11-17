USE amphora;
WITH transacoes as
(
	SELECT almoxarifado.nome as almoxarifado, transacao.*
    FROM transacao INNER JOIN almoxarifado
    ON almoxarifado.idalmoxarifado = transacao.idalmoxarifado
)
SELECT transacoes.almoxarifado as almoxarifado, usuario.nome, transacoes.data_solicitada, transacoes.quantidade_entregue, transacoes.devolvida, transacoes.data_devolvida
FROM usuario INNER JOIN transacoes ON usuario.idusuario = transacoes.idusuario AND usuario.idalmoxarifado = transacoes.idalmoxarifado AND transacoes.entregue=1;