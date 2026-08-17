# Método CIS Goiânia — recriação da landing page

Cópia de `eusougustavosampaio.com/metodocis`. Abra o `index.html` direto no
navegador — não precisa de servidor.

```
metodocis/
├── index.html
├── styles.css
└── assets/
    ├── img/    ← as 8 imagens da página (nomes legíveis)
    └── real/   ← os mesmos arquivos como vieram do site
```

## Conferência

Altura de cada bloco, num viewport de 1357px de conteúdo:

| Bloco | Original | Cópia |
|---|---|---|
| hero | 725 | 725 |
| conhecendo o Método CIS | 1126 | 1126 |
| o que é inteligência emocional | 926 | 926 |
| o ciclo (4 cards) | 558 | 558 |
| para quem é | 817 | 816 |
| depoimentos | 925 | 925 |
| edição de Goiânia | 683 | 683 |
| fundamentado em ciência | 1465 | 1466 |
| pacotes | 1330 | 1329 |
| camarotes | 352 | 352 |
| mapa | 584 | 584 |
| dúvidas | 274 | 274 |
| **página inteira** | **9765** | **9764** |

As posições horizontais também batem: card do ciclo em x292, imagem do ciclo em
x346, grade dos números em x246, grade do "para quem" em x171, vídeo vertical em
x639, selo em x135, card de plano em x49, camarote em x207, mapa em x429.

## Como a original está montada

Blocos empilhados sobre um **canvas de 960px centralizado**, com cada elemento
posicionado de forma absoluta. Vários blocos estouram esse canvas — a grade dos
4 pacotes tem 1259px, os selos 1088px, os títulos 1105px. Aqui o container *é* o
canvas de 960px, e o que passa disso recebe margem negativa para ficar centrado
**nele**, e não na janela.

Quatro blocos não estão centrados no canvas no original, e isso foi reproduzido:
imagem do ciclo 29px à esquerda, grade dos números 36px à esquerda, grade do
"para quem" 19px à direita e o mapa 13px à direita.

## Cores e tipos

- Fontes: **Sora** (400/700) no texto, **Open Sans** nos botões. "DEPOIMENTOS"
  usa Roboto 700 no original.
- Fundo `#0D1A29` em todos os blocos; o hero é `#04062E` com a foto em `cover`
  na posição `88.7805% 52.3318%`.
- Dourado `#E8A045`: CTAs, contorno dos cards do ciclo, textos de destaque.
- Âmbar `#F0C040`: botões dos planos/camarotes e os preços.
- Títulos de seção em cinza `#91999D`.
- Cards do ciclo: contorno 3px dourado, raio 35px.
- Selos: pílula dourada com contorno **branco de 5px**, raio 100px.
- Todos os botões têm raio 100px (formato pílula).

Cor de cada plano (contorno + faixa do título):

| Plano | Cor | À vista | Parcelado |
|---|---|---|---|
| EXECUTIVE | `#F97316` | R$ 2.997,00 | 12x R$ 299,70 |
| PREMIUM | `#000000` | R$ 3.997,00 | 12x R$ 399,87 |
| PLATINUM | `#91999D` | R$ 12.997,00 | 12x R$ 1.083,08 |
| VIP | `#D4A017` | R$ 20.000,00 | 12x R$ 1.666,67 |

Camarotes: 8 lugares `#1565C0`, 16 lugares `#064230`, 18 lugares `#370E5C`.

## O que saiu de propósito do original

Três coisas foram pedidas e **não** existem no site no ar — confirmei no CSS
aplicado antes de mexer:

| Item | No original | Aqui |
|---|---|---|
| Ícone das pessoas (camarote) | o arquivo é preto e quase desaparece no fundo escuro | `filter: invert(1)`, fica branco |
| Foto de Goiânia | só raio de 36px, sem borda | ganhou anel branco de 6px |
| Vídeos | embed carregado no clique | capa com play; ver abaixo |

## Player de vídeo

O vídeo toca **dentro da página**, sempre. O clique troca a capa pelo player do
YouTube com autoplay, no mesmo lugar. Não abre aba nova, não sai do site. É o
mesmo comportamento do original, que também só carrega o vídeo no clique.

Host do embed: `youtube-nocookie.com`, que é o menos restritivo e não grava
cookie de rastreio antes do play.

**Um detalhe de como abrir:** o player do YouTube exige que a página venha de um
endereço `http(s)`. Se você abrir o `index.html` com duplo clique, o endereço é
`file://`, o Chrome manda `Origin: null` e o YouTube responde **erro 153**. Isso
é regra do YouTube — nenhum código na página muda esse comportamento, e é também
por isso que o site original funciona: ele está publicado em https.

Duas formas de abrir com o vídeo funcionando:

1. duplo clique no **`abrir.bat`** (mesmo esforço que abrir o HTML) — ele sobe um
   servidor local e abre em `http://localhost:8760`;
2. publicar a pasta em qualquer hospedagem.

## Acabamento no design

A identidade é do cliente (Sora, dourado sobre navy), então o polimento ficou
nos detalhes, sem trocar cor nem tipo:

- **Botões**: gradiente do próprio dourado (`#F2B45F → #E8A045 → #DC8F2C`), peso
  600, brilho dourado difuso embaixo, luz interna de 1px no topo, e sobem 2px no
  hover. Antes eram chapados com texto em peso 400.
- **Cards** (ciclo, planos, camarotes): superfície com luz no topo
  (`#12212F → #0D1A29`) em vez de contorno chapado, mais sombra de apoio. Os
  cards de preço sobem 5px no hover.
- **Selos e faixas de título dos planos**: mesmo volume sutil.
- **Imagens**: sombra de apoio, para não parecerem coladas no fundo.
- **Ritmo**: o original é uma parede única de navy por 9.700px, e é isso que dá
  a sensação de página seca. Blocos alternados receberam `#0F1E2E` — cerca de 2%
  mais claro, quase imperceptível, mas cria ritmo.
- **Um destaque só**: o bloco de preços ganhou um brilho dourado de fundo, por
  ser o momento de decisão da página.
- Foco de teclado visível, `prefers-reduced-motion` respeitado.

Nada disso alterou a diagramação: a página continua com 9.764px contra 9.765 da
original, seção por seção.

## Observações

- **Todos os botões** vão para o WhatsApp `62 98108-4247`, cada um com sua
  própria mensagem pronta (inscrição, dúvida, pacote específico, camarote).
- Os dois vídeos são do YouTube: `WZBjljrvDac` (conhecendo) e `VksKSTzm8s4`
  (depoimentos).
- Mantive o erro de digitação "ressignifcadas" do card 3, que está assim no site.
- O original serve as imagens no tamanho exato de exibição (1x), então elas
  ficam um pouco moles em tela retina. Os arquivos como vieram estão em
  `assets/real/`.
- O mobile do original é um layout separado (11 blocos em vez de 12 — o de
  camarotes é escondido) com tamanhos de fonte próprios. Reproduzi os tamanhos
  e o comportamento, mas a altura total no celular não é igual à do original.


## Deploy no Cloudflare

Este projeto agora e publicado em eusougustavosampaio.com/metodocis via uma rota do Cloudflare Workers apontando para este worker. O build empacota os arquivos dentro de uma subpasta metodocis/ para casar com o prefixo da rota.
