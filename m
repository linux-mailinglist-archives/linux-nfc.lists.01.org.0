Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 817F033831E
	for <lists+linux-nfc@lfdr.de>; Fri, 12 Mar 2021 02:21:49 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1CD9E100ED48C;
	Thu, 11 Mar 2021 17:21:47 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C2ACC100EF25B
	for <linux-nfc@lists.01.org>; Thu, 11 Mar 2021 17:21:44 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2F1585C00CA;
	Thu, 11 Mar 2021 20:21:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 11 Mar 2021 20:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=Yv1PDMwUh7zAu6FMm+uI++TarW0
	Tf9Qkjy8pN0v0Mfo=; b=C62pLEwRtJu0DSeFKg2VKhyzES4hRPCv0TIIFpuFuHX
	4T/rdUbPRuzYt0bUt4TPnPSnlaec9aVh2jQnoSaZaAkgs0MVAoXCzkugOZDIQ1qs
	JiiBwnkzxfSSNwBhH+D+0KBWWFBFlGiI5MukcubDjJYNm+Yok2KEb9y9VWyOMeK3
	oTazldBdrBlPBaj99q+d6Vhd9KDLvq+j4gud4F/obs83Gd8XZQg/GW0v5XCaVmod
	5tNkndHIm9hLg1Pqf5KiABypJ5cgjNS1Jnbe6SJA/um8AO0XWPVlqD+oedur2aEM
	ruS4ZVEJe9rmX+ChT9MsvieSxsXuaHntzE9WNXzDy3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Yv1PDM
	wUh7zAu6FMm+uI++TarW0Tf9Qkjy8pN0v0Mfo=; b=jRtHo6cBg3YgXXPSq4wnml
	aiZepPXDJUK409OITyi70UjDFCfP8peWbb6mRMPkO7QVMPhnN6kIzjaBAriD9vXy
	uKIiQeXWBmocV7MA5uEmE1jf0Ew3f/VneE4F2UUaRILMKM8yL9PWki2unBKcTNGv
	8/7KSutQPb8lCsMfp4YQmvl1BQVgqFFQP2vI7wVBMVGbpa1apMGn7hk9kw8oC+BK
	gAEmNyUDrE0HfmX5VEX9C8GnxRYEVhzLsZURolGTUh0gvPaVTydbYoqPB83j5bHg
	8PdMsOItq0SwmRoRpptsrC1eg3+oFJNamx8irTkC4Jztj2/5uvX2q+5I/U5nW9aA
	==
X-ME-Sender: <xms:JcJKYH1ayvXQZhQDl-qzo2rRmRE8S8EBCRBNiBBJzZwCuSObkhbxig>
    <xme:JcJKYD7j0B4pi4E74CbETLeBCgHZcDTBfdLjsm6h8PCOx9623K-A-jEzHEDXzaxbl
    C8NfNZdLNULBg1luw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvuddgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpeeiuefguddtfeeitddvffetudefvdejhefgveevfedugfejffegieet
    teejudffhfenucfkphepieekrddvrdekvddrudejudenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltghrvggv
    khdrtghomh
X-ME-Proxy: <xmx:JcJKYCWrg7laOaY4J5Xrx2EMbZXxrDXm6r2G_5286dXS2SBr4ipMvg>
    <xmx:JcJKYKBqhXMJlnHy4jPdrA0_hbpaD4Xsuo7pXaB6FvRay5PvQwrYJA>
    <xmx:JcJKYJ45BaExYensifPregNSAlZnPEaPx5Pa6T1FlK2IUxaSEESy2Q>
    <xmx:J8JKYB6BLth0fua2CUmtIMdq-KOZ2YToJj2dCLmlI5uJf2xKAddBzA>
Received: from blue.animalcreek.com (ip68-2-82-171.ph.ph.cox.net [68.2.82.171])
	by mail.messagingengine.com (Postfix) with ESMTPA id C30251080057;
	Thu, 11 Mar 2021 20:21:41 -0500 (EST)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id C2F4D1360097; Thu, 11 Mar 2021 18:21:40 -0700 (MST)
Date: Thu, 11 Mar 2021 18:21:40 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Message-ID: <20210312012140.GA316619@animalcreek.com>
References: <20210311085020.429987-1-frieder.schrempf@kontron.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311085020.429987-1-frieder.schrempf@kontron.de>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: JOWGPDCYTR4TWQK244YP2RK642DW66HN
X-Message-ID-Hash: JOWGPDCYTR4TWQK244YP2RK642DW66HN
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] tag: Implement readout of tag UID via DBus interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JOWGPDCYTR4TWQK244YP2RK642DW66HN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 11, 2021 at 09:50:20AM +0100, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>

Hi Frieder.

I am supposed to be taking over neard maintenance but I have been
completely derelict in my duties.  I need to refresh my brain's
cache and look at your patch in more detail.  In the meantime,
I have a few minor comments below.

> 
> This adds a 'Uid' property to the DBus interface for tags, which
> returns the UID of the tag as byte array.

Please add more high-level information to this commit description.
For example, what problem does it solve and how does it solve it?
Something that we can look back at in 5 years and be satisfied that
it solved a problem, that it solved the problem in reasonable way,
and that it was a change worth incorporating.

> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  src/tag.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/src/tag.c b/src/tag.c
> index 9eba4ee..2039e48 100644
> --- a/src/tag.c
> +++ b/src/tag.c
> @@ -53,6 +53,7 @@ struct near_tag {
>  	uint8_t nfcid_len;
>  
>  	uint8_t iso15693_dsfid;
> +	uint8_t iso15693_uid_len;
>  	uint8_t iso15693_uid[NFC_MAX_ISO15693_UID_LEN];
>  
>  	size_t data_length;
> @@ -168,6 +169,29 @@ static const char *type_string(struct near_tag *tag)
>  	return type;
>  }
>  
> +static const uint8_t uid_array(struct near_tag *tag, uint8_t **uid)
> +{
> +	if (tag->nfcid_len) {
> +		DBG("NFCID: ");
> +		for(int i = 0; i < tag->nfcid_len; i++)
                  ^^
nit: Please put a space between the 'for' and the "('.

> +			DBG("%x", tag->nfcid[i]);
> +
> +		*uid = tag->nfcid;
> +
> +		return tag->nfcid_len;
> +	} else if (tag->iso15693_uid_len) {
> +		DBG("ISO-UID: ");
> +		for(int i = 0; i < tag->iso15693_uid_len; i++)
                  ^^
nit: Please put a space between the 'for' and the "('.

Thanks,

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
