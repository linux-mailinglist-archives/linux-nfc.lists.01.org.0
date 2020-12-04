Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81D2CE9F3
	for <lists+linux-nfc@lfdr.de>; Fri,  4 Dec 2020 09:38:02 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A7795100EBBAF;
	Fri,  4 Dec 2020 00:38:00 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.68; helo=mail-ed1-f68.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 16CBB100EBBAB
	for <linux-nfc@lists.01.org>; Fri,  4 Dec 2020 00:37:58 -0800 (PST)
Received: by mail-ed1-f68.google.com with SMTP id r5so4937647eda.12
        for <linux-nfc@lists.01.org>; Fri, 04 Dec 2020 00:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eAUgRhiSnZxN+OGD6Xc3OKsBy+RlXxdYJUYaOeKp06I=;
        b=d3lCAD+5Rp8mHJrcTM9T5iFiammAbcg1MbaMzMK3BdYleQWI+0A7SXG/SehQD+EMFm
         80H/2VvQkGWBHpWQ2SiJ/FugyLduG74J/hiqsJphViNUGaT5zyX59izNUTazIWCm5kpd
         7E5Rr0sUHLP0f6RX02x3Wot8OVFgbC0PdAJEbuFTShbrBCWBJfQ36R5HzPmXfanUqnvm
         gCH9zAX3MGwbFL5Q/mMXppu3q74ObNLIBv0N460xykbHMdu9SBBrHP/+6TDnnhuzRpRg
         AyXUAmffr/4Qa5+w8t43oVSmHYcpByeniuu9l3ndAVXcJFbZkJKTpUKf81JQD6dxPkSa
         O3Rw==
X-Gm-Message-State: AOAM533clh1JFBxQkxKFb27CrQmSqlx/CCVPG/+FalbZd2Qvz3fNCLfl
	7RwXLK6GvVJkOnrJWT4344E=
X-Google-Smtp-Source: ABdhPJwoeQ7DRUewSq/Xsuh/+Aqe+eXqWEbDCW2HM2O2CWaN5JIHQ73iQJSmCs5B/CGsVPM+2/ZnhA==
X-Received: by 2002:a05:6402:2059:: with SMTP id bc25mr6528472edb.13.1607071076163;
        Fri, 04 Dec 2020 00:37:56 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id s26sm2891210edc.33.2020.12.04.00.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 00:37:55 -0800 (PST)
Date: Fri, 4 Dec 2020 10:37:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201204083753.GB5418@kozik-lap>
References: <20201203225257.2446-1-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203225257.2446-1-bongsu.jeon@samsung.com>
Message-ID-Hash: 7LNNJ6GPMSLRIXYFH7ORDQ5GOEZQ5GKS
X-Message-ID-Hash: 7LNNJ6GPMSLRIXYFH7ORDQ5GOEZQ5GKS
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 net-next] nfc: s3fwrn5: skip the NFC bootloader mode
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7LNNJ6GPMSLRIXYFH7ORDQ5GOEZQ5GKS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 04, 2020 at 07:52:57AM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> If there isn't a proper NFC firmware image, Bootloader mode will be
> skipped.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
> 
>  ChangeLog:
>   v2:
>    - change the commit message.
>    - change the skip handling code.

Patch is now much cleaner and smaller. Thanks.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> 
>  drivers/nfc/s3fwrn5/core.c     | 23 +++++++++++++++++++++--
>  drivers/nfc/s3fwrn5/firmware.c | 11 +----------
>  drivers/nfc/s3fwrn5/firmware.h |  1 +
>  3 files changed, 23 insertions(+), 12 deletions(-)
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
