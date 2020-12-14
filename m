Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1122D9B77
	for <lists+linux-nfc@lfdr.de>; Mon, 14 Dec 2020 16:51:52 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D626F100ED4AC;
	Mon, 14 Dec 2020 07:51:50 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.67; helo=mail-ej1-f67.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4943E100ED4A9
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 07:51:48 -0800 (PST)
Received: by mail-ej1-f67.google.com with SMTP id g20so23190501ejb.1
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 07:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eUUzZ3vVO1OOxq0lP4QkRTp4abvgiVw9uyvagV8zpRw=;
        b=s/8hmjyWw9KlPNQQnEX+yCEdTdLtlJOywNvGremAVjWUEHb9T88Ax5Rfenz1yDremc
         ca3kKpUND3bSUM5pCZsmTth5rOAR2KO8ly5TsjPuqK2tzG+zyheeqOBffWjfVR5KC+jN
         ISICRHco9tHmUJVAFgi+6LCmuZggqI6DC/8Q1ZWi1tEHLSa53KwuEGGlfEdwiyFvL3H9
         jYF9fWIEtBTDaADixPLZzNcGTGqUpBCac+IGh4kajnCX/NOClke7XJ1YL60GW4k1m/ue
         zKyjIy98ALkACGWBPaMw8oO91RtkRPNSctWx3ZlPc4LES2Jq0uRp9fBphd9MiFvzM9+F
         1N9A==
X-Gm-Message-State: AOAM531Ao65c+nm/7AzW0T0H5Gn7v3tyU0oLeQJikWZzP3laCHcbVY12
	E/vOL8ID/Et91UDZkyOuKgI=
X-Google-Smtp-Source: ABdhPJxxb97fPDcZnskh2hpG0wg+EQcwXlYxQlOL8+qWuGIXGQbXxsAk++b3V32wkLIHGZ3jteoypA==
X-Received: by 2002:a17:907:40f0:: with SMTP id nn24mr22482714ejb.233.1607961106635;
        Mon, 14 Dec 2020 07:51:46 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id lr24sm13926950ejb.41.2020.12.14.07.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:51:45 -0800 (PST)
Date: Mon, 14 Dec 2020 16:51:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201214155143.GC2493@kozik-lap>
References: <20201213101238.28373-1-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201213101238.28373-1-bongsu.jeon@samsung.com>
Message-ID-Hash: 4X4ZK3CE2AU4MVQFDIGZQLKORDEBCASX
X-Message-ID-Hash: 4X4ZK3CE2AU4MVQFDIGZQLKORDEBCASX
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] nfc: s3fwrn5: Remove the delay for nfc sleep
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4X4ZK3CE2AU4MVQFDIGZQLKORDEBCASX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 13, 2020 at 07:12:38PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> remove the delay for nfc sleep because nfc doesn't need the sleep delay.

Please start sentences with capital letter.
s/nfc/NFC/ (here and in subject)

This explanation is very vague. Please rephrase it.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
