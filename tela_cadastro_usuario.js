document.getElementById('opcaoCadastro').addEventListener('change', function () {
    var opcaoSelecionada = document.getElementById("opcaoCadastro").value;
    var opcao1 = document.getElementById("opcao1");
    var opcao2 = document.getElementById("opcao2");

    if (opcaoSelecionada === "aluno") {
        opcao1.style.display = "block";
        opcao2.style.display = "none";
    } else if (opcaoSelecionada === "professor") {
        opcao2.style.display = "block";
        opcao1.style.display = "none";
    } else {
        opcao1.style.display = "none";
        opcao2.style.display = "none";
    }
});
