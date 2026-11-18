enum Categoria {
  whatsapp('WhatsApp'),
  sms('SMS'),
  ligacao('Ligação'),
  email('E-mail'),
  pix('Pix'),
  redesSociais('Redes sociais');

  final String label;

  const Categoria(this.label);
}
