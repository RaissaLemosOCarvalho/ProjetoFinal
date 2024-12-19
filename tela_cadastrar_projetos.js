$(document).ready(function() {
    $('#pesquisa_colaboradores').on('input', function() {
        var termo = $(this).val();
        if (termo.length > 1) {
            $.ajax({
                url: '../php/buscar_usuarios.php',
                type: 'GET',
                data: { termo: termo },
                success: function(data) {
                    var usuarios = JSON.parse(data);
                    $('#resultados_pesquisa').empty();
                    usuarios.forEach(function(usuario) {
                        $('#resultados_pesquisa').append('<li class="list-group-item" data-id="' + usuario.id + '">' + usuario.nome + '</li>');
                    });
                }
            });
        } else {
            $('#resultados_pesquisa').empty();
        }
    });

    $(document).on('click', '#resultados_pesquisa li', function() {
        var id = $(this).data('id');
        var nome = $(this).text();
        $('#colaboradores_selecionados').append('<li class="list-group-item" data-id="' + id + '">' + nome + '<button class="btn btn-danger btn-sm float-right remover-colaborador">Remover</button></li>');
        $('#resultados_pesquisa').empty();
        $('#pesquisa_colaboradores').val('');
        $('#colaboradores_selecionados_container').show();
    });

    $(document).on('click', '.remover-colaborador', function() {
        $(this).parent().remove();
        if ($('#colaboradores_selecionados li').length === 0) {
            $('#colaboradores_selecionados_container').hide();
        }
    });

    $('form').on('submit', function() {
        var colaboradores = [];
        $('#colaboradores_selecionados li').each(function() {
            colaboradores.push($(this).data('id'));
        });
        $('<input>').attr({
            type: 'hidden',
            name: 'colaboradores',
            value: JSON.stringify(colaboradores)
        }).appendTo('form');
    });
});
