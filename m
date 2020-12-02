Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7462CC335
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Dec 2020 18:16:47 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8AF86100EBB6E;
	Wed,  2 Dec 2020 09:16:45 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.67; helo=mail-ed1-f67.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CA6D1100EBB61
	for <linux-nfc@lists.01.org>; Wed,  2 Dec 2020 09:16:42 -0800 (PST)
Received: by mail-ed1-f67.google.com with SMTP id u19so4821019edx.2
        for <linux-nfc@lists.01.org>; Wed, 02 Dec 2020 09:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+UAanY5PNunboQWAira1n5v88pFyvRSB0kuWX0KJKy8=;
        b=FySUC6S+ORpZcm7sh0eTuhPKn1wis8hkPsA6e7v3TzI6NtcgIlMhOhzcXkSPfvTdRJ
         +W2AwMO5IzVYWOudtfT4eCTg999GCZmyLm6kNv73Brx8Jt6ii0hNkRyuLF8Vaa+tcH46
         0Z0x+JRdQS+sKQ16oX+vSBl/9VxsQVSxJr1CPmMm+qdsN9Jki8hkGeWxT632QdlbEwS3
         1g0SstpxE5zLtj31T1+r6+R+E9mAo40oghc5lvV7maHOZIXJ/VwKHP9vxdU/LwuE4Fmy
         8BAW6LsFaQ3P4wSEBkdPIcZe6mmAaM7ej9w9htsUpSjezQ52GpXexh/bq/O8D2WKK+Hd
         prng==
X-Gm-Message-State: AOAM530coLxKrapHMYAmGLafueroCWB4XLq6Rn+79hl1BRuXeLq19ViG
	gD9D1ZfnutZHTc2crOHcTSw=
X-Google-Smtp-Source: ABdhPJw6F9Z2HCezk2gyTIqGZ20AJAmWFUFXLwWo7OZP94BHm5G2cz934XVMG/oAoSjGQJpBMXZ9fw==
X-Received: by 2002:aa7:dc5a:: with SMTP id g26mr948538edu.35.1606929401213;
        Wed, 02 Dec 2020 09:16:41 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id n1sm349851ejb.2.2020.12.02.09.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 09:16:40 -0800 (PST)
Date: Wed, 2 Dec 2020 19:16:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201202171638.GA2778@kozik-lap>
References: <1606909661-3814-1-git-send-email-bongsu.jeon@samsung.com>
 <1606909661-3814-2-git-send-email-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606909661-3814-2-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: GUAA3NBHDB5BOBXWRSLUIXM6O3ZMRRQ7
X-Message-ID-Hash: GUAA3NBHDB5BOBXWRSLUIXM6O3ZMRRQ7
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v5 net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GUAA3NBHDB5BOBXWRSLUIXM6O3ZMRRQ7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 02, 2020 at 08:47:38PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> Since S3FWRN82 NFC Chip, The UART interface can be used.
> S3FWRN82 supports I2C and UART interface.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  .../bindings/net/nfc/samsung,s3fwrn5.yaml          | 31 +++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
