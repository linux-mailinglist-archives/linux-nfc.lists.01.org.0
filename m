Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3863EED5F
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Aug 2021 15:28:52 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8FB43100EB825;
	Tue, 17 Aug 2021 06:28:51 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 00A2A100EB82B
	for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:48 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id bo18so32165474pjb.0
        for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AT62RXHqJfKbcR6X3TeYMegXESMAuTVW1E7jSVe5RPc=;
        b=M0F4EnGaCWxzEipOM7PvsbKgNcLsxd5xsxwy4td6PJIBoNrztJBj6Q1MCtafYVUvPa
         VpYyyOWsFNU5g/DZdyEB6IssLuzIgbrKoqGbuTiVK2EETR//7JGs7YFAD4/yOJ9gh6dm
         JSRmeo0FnoP6n3HlHWq8+hSaSVlwC05JI28bjrRCBZjJjQRXavTyUL89ZUWI0JDGoA9g
         CR7JgwqVeQBPN4yJ1MK3vS6kmdwjxlnUKAwJyhSvO37jvpk3UFaN6bHOAweCHNswtfQm
         XTy7UtfFSmm21xs0SfE0Qe4LG4M9ru/nZTmJFyrNBVZ3O4oVpTdZlVtxR9ZY3NhI778B
         97Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AT62RXHqJfKbcR6X3TeYMegXESMAuTVW1E7jSVe5RPc=;
        b=e3EsLqyiLmY25apqQbwNNsA8H8lxJxOz6Wm2m3L3fdb9QzUuqatSGymIzn8iPrOyIw
         fb83KoddScVyrehsdhRqqspP0noGUy8hdFkkQD6qZFJl3TjaPjpRKYEmcGvW7QFIiAus
         ivvHvbsbF4r/O/WRBumu/CyMM1pt5SvYqeRrqKXwJGSbN/Sl+IdX2bdTODoGRg+yRFVc
         zRBUTUiXwAD9LhYohyeHWtGcA/hCw8HaP6uH72CMM+fH3UXgAN95vF3pd9/A09nXR8GH
         8wPbuzpfesM78tdY1OnP6/AJ3kIDbA7cm8fu+W7dNCdemGKDIa/SSpqJ0VFSP3L0OyA/
         KlPA==
X-Gm-Message-State: AOAM530ap3rLjO08Jo3RmOsHf3a3Lh8qhBTQE8WDH0kF/UxGeGIKBaZr
	iU/VWcO1haujq9e+CKYRJkY=
X-Google-Smtp-Source: ABdhPJxPCbvC1yl1vWldfcDvuPZmdNEkGKZNQ2wxGEqc0KqwMjzx01N0FXE00uemKimYyFzz5dwOZw==
X-Received: by 2002:a05:6a00:248a:b029:3e0:9be4:963f with SMTP id c10-20020a056a00248ab02903e09be4963fmr3738393pfv.29.1629206928812;
        Tue, 17 Aug 2021 06:28:48 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id j6sm2791577pfi.220.2021.08.17.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:28:48 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Tue, 17 Aug 2021 06:28:15 -0700
Message-Id: <20210817132818.8275-6-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
References: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
MIME-Version: 1.0
Message-ID-Hash: XCNTSYNNLQZZMSPLJ6A2FISMWE5KBDFL
X-Message-ID-Hash: XCNTSYNNLQZZMSPLJ6A2FISMWE5KBDFL
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 5/8] selftests: nci: Fix the wrong condition
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XCNTSYNNLQZZMSPLJ6A2FISMWE5KBDFL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

memcpy should be executed only in case nla_len's value is greater than 0.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index cf47505a6b35..a1786cef73bc 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -110,7 +110,7 @@ static int send_cmd_mt_nla(int sd, __u16 nlmsg_type, __u32 nlmsg_pid,
 		na->nla_type = nla_type[cnt];
 		na->nla_len = nla_len[cnt] + NLA_HDRLEN;
 
-		if (nla_len > 0)
+		if (nla_len[cnt] > 0)
 			memcpy(NLA_DATA(na), nla_data[cnt], nla_len[cnt]);
 
 		prv_len = NLA_ALIGN(nla_len[cnt]) + NLA_HDRLEN;
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
