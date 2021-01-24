Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A3301DF1
	for <lists+linux-nfc@lfdr.de>; Sun, 24 Jan 2021 18:38:48 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B2D9D100ED49C;
	Sun, 24 Jan 2021 09:38:46 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4A3D2100EF267
	for <linux-nfc@lists.01.org>; Sun, 24 Jan 2021 09:38:45 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 246F15C00A3;
	Sun, 24 Jan 2021 12:38:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 24 Jan 2021 12:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=hFuytUMxrsRHZuxgi8tWvmAayIS
	GiEYy95yz/w2iQA8=; b=dB/LVoCdGWgV/gr8Lh/mvCMv+nsBPtNmXFSA/GB6JJy
	lT7YpdlwdQhco9EqJbTf8vqOLYeEk7qVPGWaFh3Mi7PycJ1z//gkORPZumUl4QFO
	U/v7EO0TJTwiMSOt/8FRYwZbRjXQZmrGfYLYOlNunGAX7PZ5lQ4vndtBVkN/tiV6
	xDFHXEzCUAxnFu9uQIWfgwJVDEIgxoxRRcVYAqwg+YsN5Qk4yOwLwUfOxjNgqWF2
	N3UOl6DQHNBwz9R3qdtIEDbNEaRtU4oII9YVnIhoVoA5L1avYehr6Ib/tPWRoQvQ
	HX5DeFFFPuDP2+RPfl0qLWHrCMNIUmRgnRneRoRx7Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hFuytU
	MxrsRHZuxgi8tWvmAayISGiEYy95yz/w2iQA8=; b=mzPsFzVYsGMBPui//S75rj
	/QOg5LQeiblERR9EziJ7PfxR4aaxOZppEwCZ9Q3gab/81bdwVtKchKi8MJP5smVu
	vP1IRP2w3VQGCCfE2ffdBa8OY8CM2KfgM6gO68kH/lF4A/7ljzpWC0P2viDodwaB
	bvbaIPSoPv2qsj3egczzkSiFBXS9TM/oRMxhMPo1cP6D7vgs8eTRDYIo9ZHw0xQO
	Mz41q7VHe/84YXhxDhJcgbXYyiGAEnQKmHsERocgIdmQW3JgNcCDBd1ckF0ouI3+
	sCoWc34iOeR7hYKku6bBz796SZMzyWInD0OlrAueOT66AgQBvbePtih6BDWQd2xQ
	==
X-ME-Sender: <xms:o7ANYANBx_A9U5HB7kUv3bBYoYonzeSsn1kB9prNTZ4as13oB3qTHQ>
    <xme:o7ANYG98-VmjJmS5VheXk8qHSCVBOg1lLZzbzXRiI88FhrBrMOfXJ1DjcRseifgKw
    rBLXut8s6Txkd0jsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddugddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujghosehttd
    ertddttddvnecuhfhrohhmpeforghrkhcuifhrvggvrhcuoehmghhrvggvrhesrghnihhm
    rghltghrvggvkhdrtghomheqnecuggftrfgrthhtvghrnhepieeugfdutdefiedtvdffte
    dufedvjeehgfevveefudfgjeffgeeiteetjedufffhnecukfhppeeikedrvddrkedvrddu
    jedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    hgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:o7ANYHQNumQjNlqXBQeK52yAE-yv1SDiLCY5pbImWydo6VMMzpw3ow>
    <xmx:o7ANYIteIU9yOHjbQE_8J81KrAzLIoiaNiwuv_B2S3PEKLraaIlAxA>
    <xmx:o7ANYIfnjZpsofmgNMw0O7a-qFKWXXcXZFfp5fHcNa_yPeYskENjKw>
    <xmx:pLANYH5C7Zst5GUtT4dH1tSzU4wvDefVcNpPJtYxnP6paeldc5InVg>
Received: from blue.animalcreek.com (ip68-2-82-171.ph.ph.cox.net [68.2.82.171])
	by mail.messagingengine.com (Postfix) with ESMTPA id E39B224005B;
	Sun, 24 Jan 2021 12:38:42 -0500 (EST)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 61F451360081; Sun, 24 Jan 2021 10:38:42 -0700 (MST)
Date: Sun, 24 Jan 2021 10:38:42 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: samirweng1979 <samirweng1979@163.com>
Message-ID: <20210124173842.GC31737@animalcreek.com>
References: <20210123052618.2448-1-samirweng1979@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210123052618.2448-1-samirweng1979@163.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: I2CLKU4DGW7XY3NLI6MSIFBPC6Q6D3BC
X-Message-ID-Hash: I2CLKU4DGW7XY3NLI6MSIFBPC6Q6D3BC
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-wireless@vger.kernel.org, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, wengjianfeng <wengjianfeng@yulong.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] nfc: fix typo
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/I2CLKU4DGW7XY3NLI6MSIFBPC6Q6D3BC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 23, 2021 at 01:26:18PM +0800, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> 
> change 'regster' to 'register'
> 
> Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
> ---
>  drivers/nfc/trf7970a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
> index c70f62fe..3397802 100644
> --- a/drivers/nfc/trf7970a.c
> +++ b/drivers/nfc/trf7970a.c
> @@ -169,7 +169,7 @@
>  
>  /* Bits determining whether its a direct command or register R/W,
>   * whether to use a continuous SPI transaction or not, and the actual
> - * direct cmd opcode or regster address.
> + * direct cmd opcode or register address.
>   */
>  #define TRF7970A_CMD_BIT_CTRL			BIT(7)
>  #define TRF7970A_CMD_BIT_RW			BIT(6)

Acked-by: Mark Greer <mgreer@animalcreek.com>
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
