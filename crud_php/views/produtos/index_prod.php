<?php
// Inclui o controller corretamente usando __DIR__
include_once __DIR__ . '/../../controllers/ProdutoController.php';

// Instancia o controller e obtém os dados
$controller = new ProdutoController();
$data = $controller->index();
$stmt = $data['stmt'];
$num = $data['num'];

// Inclui o header
include __DIR__ . '/../../views/includes/header.php';
?>

<h2>OFERTAS RELÂMPAGO!</h2>

<!-- Aviso de carrinho -->
<div class="cart-box">
    <p> Você está visualizando o <strong>carrinho da loja</strong>. Aqui estão os produtos adicionados!</p>
</div>

<a href="/crud_php/public/index.php?page=produtos&action=create" class="button">Adicione produto ao carrinho</a>

<?php
if ($num > 0) {
    $produtos = [];

    echo "<table>";
    echo "<tr>";
        echo "<th>ID</th>";
        echo "<th>Nome</th>";
        echo "<th>Descrição</th>";
        echo "<th>Preço</th>";
        echo "<th>Categoria</th>";
        echo "<th>Ações</th>";
    echo "</tr>";

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $produtos[] = $row;

        echo "<tr>";
            echo "<td>{$row['id']}</td>";
            echo "<td>{$row['nome']}</td>";
            echo "<td>{$row['descricao']}</td>";
            echo "<td>R$ " . number_format($row['preco'], 2, ',', '.') . "</td>";
            echo "<td>{$row['categoria_nome']}</td>";
            echo "<td>";
                echo "<a href=\"/crud_php/public/index.php?page=produtos&action=edit&id={$row['id']}\" class=\"button edit\">Editar</a> ";
                echo "<a href=\"/crud_php/public/index.php?page=produtos&action=delete&id={$row['id']}\" class=\"button delete\">Deletar</a>";
            echo "</td>";
        echo "</tr>";
    }

    echo "</table>";

    // Calcula o valor total
    $valorTotal = 0;
    foreach ($produtos as $produto) {
        $valorTotal += $produto['preco'];
    }

    echo "<div class='total-box'>";
    echo "<h3>Valor total dos produtos: <span class='yellow'>R$ " . number_format($valorTotal, 2, ',', '.') . "</span></h3>";
    echo "</div>";

} else {
    echo "<p>Nenhum produto encontrado.</p>";
}
?>

<?php include __DIR__ . '/../../views/includes/footer.php'; ?>
