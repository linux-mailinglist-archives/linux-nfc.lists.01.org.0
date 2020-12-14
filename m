Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BAD2D9BA2
	for <lists+linux-nfc@lfdr.de>; Mon, 14 Dec 2020 17:02:11 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C519B100ED4AF;
	Mon, 14 Dec 2020 08:02:09 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.67; helo=mail-ej1-f67.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id ADC9A100ED4AC
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 08:02:06 -0800 (PST)
Received: by mail-ej1-f67.google.com with SMTP id j22so5208911eja.13
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 08:02:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QjL4adJZs0AMrAVUGFkpZofpmty3/E0ZmCXzxBFdS9g=;
        b=Xe88t5GQWZ64f0x8cADtM/gKiZm41URMsWmg38KBoY6yxsodOv8jmUcIeLslfJZWFA
         vThoE3rguN2wat7Lxo52neCVBzvmlLCt9dXAqMongJFap7vX+2TttAoOItArtlhRDmci
         dKOR8JVT3glYIzQwB3XercGrZdRyVkWwgcJJjpAwOLyd9GLhSBwP73SFffh7KaOxaPMH
         tGNag2FjBwfGFNi5c9XwLIJZ3coHY8NAG2R7RmrYGXgqWsfdEpJrGAVBLgtyP8QDwc3G
         HCnOo4/daKtxDx7UQ2oXsFvlynf2hClJ9N1xI1ZGZ37HCd0m6x59ZeQqxv1h795ZwtjS
         8Log==
X-Gm-Message-State: AOAM530Y4F5mEpagB+VAfAN9ekT7HyczYQqjPCgohMuW3keHhaoxW1kb
	GquEFTmdDOXiwNZmHC5z7EM=
X-Google-Smtp-Source: ABdhPJxgm18FCHtI7zbS+tHOST8IHEw9MAaGTjBilw+edq/rstPkLCaEEIN/uqe33+uqdKnICVG9Bg==
X-Received: by 2002:a17:906:b096:: with SMTP id x22mr1836794ejy.471.1607961725125;
        Mon, 14 Dec 2020 08:02:05 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id zn5sm14034216ejb.111.2020.12.14.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 08:02:03 -0800 (PST)
Date: Mon, 14 Dec 2020 17:02:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201214160202.GD2493@kozik-lap>
References: <20201214114658.27771-1-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214114658.27771-1-bongsu.jeon@samsung.com>
Message-ID-Hash: RVIX65TXUZ765IDDYY72WIAQVPU6GVRB
X-Message-ID-Hash: RVIX65TXUZ765IDDYY72WIAQVPU6GVRB
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] nfc: s3fwrn5: Remove unused nci prop commands
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RVIX65TXUZ765IDDYY72WIAQVPU6GVRB/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 14, 2020 at 08:46:58PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> remove the unused nci prop commands that samsung driver doesn't use.

Don't send patches one-by-one, but group them in a patchset.

Previous comments apply here as well - NCI is acronym, start with
capital letter.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
