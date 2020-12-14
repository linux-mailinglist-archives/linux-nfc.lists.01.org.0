Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE282D9B5D
	for <lists+linux-nfc@lfdr.de>; Mon, 14 Dec 2020 16:47:54 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8928C100ED4A9;
	Mon, 14 Dec 2020 07:47:52 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.68; helo=mail-ej1-f68.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7CC2B100ED4A5
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 07:47:50 -0800 (PST)
Received: by mail-ej1-f68.google.com with SMTP id w1so18465153ejf.11
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 07:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SgRen1ZhC/pAe8vYBTZ3kKObm5NlQwhtZvoSZbvu9sE=;
        b=HFexcLFX6rRlVX6QV5yk1Di5bXR23O9DO3W0sjaTyHitQaDm/B4sKR2NNcNSAAEkSr
         E6otUuPD2gxbPh74mhd5Jv/tkOo+MxgG4kBZGrt3RbVpAFQtpsaclQpwefr1nYmNPMof
         vckNy9meGUnBM0ukRGQx46ANu6t41j9mjKIfyIaiCv/fDK3o1i+TyG0FPl9rKr48CJMS
         sBALm980BfpX5aibELTPYU9RrGri9X03NJgDdCLM5vYBRkvhWnPoEVDPPriM4kNttkJm
         L9+hXX783xdB9lmBZCFXjSjt+19vCx6sRFratNrrXhzVUBlgYuOm0vvjyoGq+ow+5jRb
         sogg==
X-Gm-Message-State: AOAM533H9caeh7lbj0NXWmVPDBpdMe77uL+AcLE9MZRwrJyF+Je+Au/U
	mSD4wYOlzjBRD4kYOCkLLJw=
X-Google-Smtp-Source: ABdhPJzQpZw36joO+GpvD5q8984HG7N+a5LaSC3eo13U2hHRfzNJ6pYFTSIHPku1b+VISvHX8g6fhw==
X-Received: by 2002:a17:906:ce21:: with SMTP id sd1mr22545331ejb.396.1607960868963;
        Mon, 14 Dec 2020 07:47:48 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z24sm15898561edr.9.2020.12.14.07.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:47:47 -0800 (PST)
Date: Mon, 14 Dec 2020 16:47:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201214154745.GB2493@kozik-lap>
References: <20201213095850.28169-1-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201213095850.28169-1-bongsu.jeon@samsung.com>
Message-ID-Hash: 5NTIIZX57XGTYYC4DDP2WQJ5E7GDSJ6R
X-Message-ID-Hash: 5NTIIZX57XGTYYC4DDP2WQJ5E7GDSJ6R
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] nfc: s3fwrn5: Release the nfc firmware
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5NTIIZX57XGTYYC4DDP2WQJ5E7GDSJ6R/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 13, 2020 at 06:58:50PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> add the code to release the nfc firmware when the firmware image size is
> wrong.

s/add/Add/
s/nfc/NFC/

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
