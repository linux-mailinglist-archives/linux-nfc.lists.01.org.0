Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D884F2B5A6C
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Nov 2020 08:42:16 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 62104100EF24C;
	Mon, 16 Nov 2020 23:42:15 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.67; helo=mail-wr1-f67.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 85C18100EF24A
	for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 23:42:12 -0800 (PST)
Received: by mail-wr1-f67.google.com with SMTP id k2so22171889wrx.2
        for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 23:42:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V6lmdmyelkoEB9gzAp95iXGDLbWF/DQXwrl5ihHxXqg=;
        b=gM2hbWwlcpnPLgCpsKXE/bnYUf7V7HzKDFGNHYJcanImh50rHD+QrWj6T0R9hIOe7R
         hjVOmxMhuyWjyKaowHc54PwfwzsulQUckIrGWa9TxxMbmwUh6b7la1ZiOFUPRPScUMRd
         +CscPgmXz8hEZPNzp7bQYBXdlE/elm4Xrre8ENsUHBq72xFdyqq0Ul3dnDNJTiTXV5T4
         lg2GozwtEc959Lz88LH1Q64Bc423CTyJBrveU5wNWLZLN6K/JE9xZmisA4cDigUx/GD4
         1+4ECozLRyjCW/IrvXJfEY1yYT5YDBGIuCL5fNKIXtMDn/PESHDBsABaAiyCtLThtqR3
         5CVw==
X-Gm-Message-State: AOAM530JP2fGhiJpMj4HO7tqYV801+/hJCsl92RFcNGBUbvbW9p6N5Iu
	Xto58E1o6/Ac7GMV+bGEUNs=
X-Google-Smtp-Source: ABdhPJwz7v/JwkX1NfdLdtvc4Gd0wHaN4a6K1NJBmsfKsXIKeWm7WCxP5OxJ4lTjZ+Tp39bypmoKAQ==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr22519988wrs.235.1605598930245;
        Mon, 16 Nov 2020 23:42:10 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z22sm2385254wml.9.2020.11.16.23.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 23:42:09 -0800 (PST)
Date: Tue, 17 Nov 2020 08:42:07 +0100
From: "krzk@kernel.org" <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon@samsung.com>
Message-ID: <20201117074207.GC3436@kozik-lap>
References: <CGME20201117011611epcms2p22fb0315814144e94856a96014c376a04@epcms2p2>
 <20201117011611epcms2p22fb0315814144e94856a96014c376a04@epcms2p2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117011611epcms2p22fb0315814144e94856a96014c376a04@epcms2p2>
Message-ID-Hash: 6XANV5MDINU3YROMKV35GGFV2EIAEQ2B
X-Message-ID-Hash: 6XANV5MDINU3YROMKV35GGFV2EIAEQ2B
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next v2 1/3] nfc: s3fwrn5: Remove the max_payload
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6XANV5MDINU3YROMKV35GGFV2EIAEQ2B/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2020 at 10:16:11AM +0900, Bongsu Jeon wrote:
> max_payload is unused.

Why did you resend the patch ignoring my review? I already provided you
with a tag, so you should include it.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
