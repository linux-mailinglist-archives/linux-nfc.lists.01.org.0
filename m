Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C64763EED5E
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Aug 2021 15:28:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 78948100EB822;
	Tue, 17 Aug 2021 06:28:48 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 33283100EB825
	for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:46 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso5130048pjh.5
        for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RIKkDqG4Bg10qu8DR0aLV3Va/c5MtW/oah6DQGWgYF4=;
        b=RHCBR/4kIwAVhymzHU1dvwJ5hgAg08CLTTzU5H2kj7nd6R52lnSIb78rZEkoMjt51O
         9FnmFbGPKGRes+/FsuX6Dn0O3hKEcJ8ahlpmxvO3yVbaL88CPwGGmQBQwdl8T+AQD6am
         1ayqZRj5bdRHi41Z8nL7av893v3PhgDS0HfwrB4QgE4SMdrwccA+gfqMmV1e6a5VO5//
         5eMSKm4c/2wLGUoJDOpbJAnV2m90CcH4+A53XwEXd/hA9q2nzrJSd0UskCdnyNe1fVLi
         oJDWa3iifaXYyQ8PJ4KNe+IdUkcn2vsnhS367yLa0rdoC/A6OPvIqxq+gX8XWaJYo754
         AzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RIKkDqG4Bg10qu8DR0aLV3Va/c5MtW/oah6DQGWgYF4=;
        b=ob/g37fADGhnac9y2LKE7e0SHxeCtcJ+oHeVV3iN65KSDLGfT0sWpgh9CJo5u82TCB
         OvEhph2IysXLcEsSML49/1bX0/H4P/L4n0ROTCsCikbo4uhHxSVa7yvaX6T1PNrkZyXD
         +lTU/u2h+biBIvV+EvpJDD0ATB4aLsLxR+qvx+B7VL481iyCqr0fFGhYKHCfzgl/v/vO
         4h6c2CnC5NO1mjoIL2mmlDH5DVKO/xVb21vFBnDZC279o6RdmfNZrR1LRJ1mZo7ZHyQp
         eZ7BkCh1QPpa/3mzXY9WmBaxtn+3DVqIl7CWjonb1Wm9sb6UhY5UJdWtPO1XYRo1dg0w
         kNpg==
X-Gm-Message-State: AOAM530mhH5iJb+g9IZsY+WOlZ5HPAE/g5XYiS9dU1T7AJtvEjI6WNbC
	zo1Mg+4meTEayHry2PueR5E=
X-Google-Smtp-Source: ABdhPJy96PxmH0bAK+Ra4yO7Ly45J4qpAOr9MpBpGFiLLiz3+Ua/51QnU6DQgNHjkf5DXfnag9etCw==
X-Received: by 2002:a63:1e4e:: with SMTP id p14mr3551907pgm.261.1629206925874;
        Tue, 17 Aug 2021 06:28:45 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id j6sm2791577pfi.220.2021.08.17.06.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:28:45 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Tue, 17 Aug 2021 06:28:14 -0700
Message-Id: <20210817132818.8275-5-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
References: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
MIME-Version: 1.0
Message-ID-Hash: 4XPBD3FQIHRNYC3I6PYQVZOJWKONP54Z
X-Message-ID-Hash: 4XPBD3FQIHRNYC3I6PYQVZOJWKONP54Z
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 4/8] selftests: nci: Fix the code for next nlattr offset
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4XPBD3FQIHRNYC3I6PYQVZOJWKONP54Z/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

nlattr could have a padding for 4 bytes alignment. So next nla's offset
should be calculated with a padding.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index b4d85eeb5fd1..cf47505a6b35 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -113,8 +113,8 @@ static int send_cmd_mt_nla(int sd, __u16 nlmsg_type, __u32 nlmsg_pid,
 		if (nla_len > 0)
 			memcpy(NLA_DATA(na), nla_data[cnt], nla_len[cnt]);
 
-		msg.n.nlmsg_len += NLMSG_ALIGN(na->nla_len);
-		prv_len = na->nla_len;
+		prv_len = NLA_ALIGN(nla_len[cnt]) + NLA_HDRLEN;
+		msg.n.nlmsg_len += prv_len;
 	}
 
 	buf = (char *)&msg;
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
