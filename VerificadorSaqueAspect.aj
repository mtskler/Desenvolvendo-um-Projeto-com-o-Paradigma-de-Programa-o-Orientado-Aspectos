public aspect VerificadorSaqueAspect {
    pointcut saqueExecutado(double valor) : 
        call(void ContaBancaria.sacar(double)) && args(valor);

    before(double valor) : saqueExecutado(valor) {
        // Lógica de verificação de todas as contas
        // Neste exemplo apenas a conta atual é verificada
        ContaBancaria contaAtual = thisJoinPoint.getTarget();
        if (valor > contaAtual.getSaldo()) {
            System.err.println("[Erro] Tentativa de saque de " + valor + " em " + contaAtual.getClass().getSimpleName() + " por " + contaAtual.cliente + " - Saldo insuficiente.");
        }
    }
}
