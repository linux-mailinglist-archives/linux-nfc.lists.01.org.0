Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FBC2DA9D6
	for <lists+linux-nfc@lfdr.de>; Tue, 15 Dec 2020 10:12:56 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 70053100EBBB3;
	Tue, 15 Dec 2020 01:12:55 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.65; helo=mail-ed1-f65.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 75F80100EBBB2
	for <linux-nfc@lists.01.org>; Tue, 15 Dec 2020 01:12:53 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id c7so20175882edv.6
        for <linux-nfc@lists.01.org>; Tue, 15 Dec 2020 01:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nsDxA7RpD1AJCH7CZ3WIXINau+V/HHIwvOEBUiHihzk=;
        b=VPKBTSxexPMjCYJFBDH8nQ6MlrUpKtwHJaxvp1obKI7jwGWsHR4xThE6fV/j6/Ce7w
         EgWH94B+2IcFLuE6bLjtAMRensZ1d4AR63ld+DkkZlaDFa83zg50gCH7/4Rb6484Xssd
         ycrOXeEkstCdkfJWqGDeI7w514nyUZQlfKRwzVg+7lngFJv+vrbySXuydWRgYvNeQzkZ
         mdsA57o1i+o1qWHH5LF6iLVjxJSHVKNwTcMorgTpeCJs1cCVuqS9FLQgD7/nr3wkeaUU
         9gjFvfxJ3d5FXeduSPAV2u8O41TQEk1satR6kvtlt1EFW5L5Mi90X2vP4U2Xtn2+Nkma
         yUbg==
X-Gm-Message-State: AOAM533ossk0QisiptWPV0DZKs/9WM7JUMYdRUFBW8seL4cvzU5RCMQK
	shllrXtCisYkm/zrmwd9R8U=
X-Google-Smtp-Source: ABdhPJyiRqmyU1ibJRCeaSSgJvp6sz/kG6v3LENX5LiDk3ZugznN56TYSpkPr8MPcHPQBQpq1NR3gw==
X-Received: by 2002:a05:6402:2066:: with SMTP id bd6mr28508608edb.211.1608023571913;
        Tue, 15 Dec 2020 01:12:51 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id k21sm18701931edq.26.2020.12.15.01.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 01:12:50 -0800 (PST)
Date: Tue, 15 Dec 2020 10:12:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201215091249.GA29321@kozik-lap>
References: <20201215065401.3220-1-bongsu.jeon@samsung.com>
 <20201215065401.3220-2-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215065401.3220-2-bongsu.jeon@samsung.com>
Message-ID-Hash: 3BBBCYGC2BZEL3Q2LCP5Z6FGTEIMNGJO
X-Message-ID-Hash: 3BBBCYGC2BZEL3Q2LCP5Z6FGTEIMNGJO
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 net-next 1/2] nfc: s3fwrn5: Remove the delay for NFC sleep
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3BBBCYGC2BZEL3Q2LCP5Z6FGTEIMNGJO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 15, 2020 at 03:54:00PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> Remove the delay for NFC sleep because the delay is only needed to
> guarantee that the NFC is awake.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/phy_common.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
