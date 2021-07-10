Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DEC3C325E
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:25 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BF4C3100EB826;
	Fri,  9 Jul 2021 20:39:20 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 28F2C100EBB75
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:18 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pk-0007Th-Up
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:17 +0000
Received: by mail-wr1-f72.google.com with SMTP id l21-20020a0560000235b029013564642c78so3713322wrz.9
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cDfPe4u6x8w+YVZsrZgHFqm9J/pUe4zvhxxAJ+7Ccck=;
        b=E6plKStYNstFgtOnWQ6G3IrpZ/LHT2AfCYnklhlkQ/bHYS5ZqIAu9qRt8h9w9rkuzu
         YPT+9B+7VDUh+OI+40sGdBZ80bx/c3O/JmhKsI6dePmWZQcFq4MtqtSVBFrWWrh4BSe4
         FY2XvtDYBq+nee+zBeOQSqEjHo86MHbE5nbkZ+0Ey5U4wQkMNBW13VxpJCz6bVyshq60
         tr62GXzlcCW0RkelTeH1cFALLGC+hz1WkL7cDGnmv5jxiC2Q78fidmrUXBZNphtFcaGv
         jIcZ5TTjhi9m9++jdBAZ+5I+mOAUKoc2ZRCXrJ9/Jd49wRyQ4CHIa3ujG0Hgk5h4Hw8N
         8kHA==
X-Gm-Message-State: AOAM533CaFqmUcDB/9EQ/0nVO0lFPMTdSIw1AYaMFWw3S4N421Laep3j
	IQTHn9FioBGj5QS/EDyBlSNnZZ29XwjRJjz2k6XDLXMGjPdGG0dpDO2c60PEbl4upDM5hpoEfA0
	h8qU2mo3nkCI8UFmne5GGiSEhFGBkvH7Hlw==
X-Received: by 2002:a05:600c:5107:: with SMTP id o7mr31540329wms.184.1625888356484;
        Fri, 09 Jul 2021 20:39:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPqUca6hR21nnDETa87XPSawIhECdO7iddG6joI3IOr9yi8KABJkHnrJMV1c0nY52EYc5pUA==
X-Received: by 2002:a05:600c:5107:: with SMTP id o7mr31540318wms.184.1625888356322;
        Fri, 09 Jul 2021 20:39:16 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:47 +0200
Message-Id: <20210710033859.3989-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5C2LKNF7LHAEHWQBDZKQOWNFV4ZEFZJP
X-Message-ID-Hash: 5C2LKNF7LHAEHWQBDZKQOWNFV4ZEFZJP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 04/16] ci: temporarily disable Ubuntu Hirsute
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5C2LKNF7LHAEHWQBDZKQOWNFV4ZEFZJP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

"Install additional packages" hangs on:

    Setting up tzdata (2021a-1ubuntu1) ...
    debconf: unable to initialize frontend: Dialog
    debconf: (TERM is not set, so the dialog frontend is not usable.)
    debconf: falling back to frontend: Readline
    Configuring tzdata
    ------------------

    Please select the geographic area in which you live. Subsequent configuration
    questions will narrow this down by presenting a list of cities, representing
    the time zones in which they are located.

      1. Africa   3. Antarctica  5. Arctic  7. Atlantic  9. Indian    11. US
      2. America  4. Australia   6. Asia    8. Europe    10. Pacific  12. Etc
    Geographic area:

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index bd6892343b4f..fb754ac78038 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -9,9 +9,10 @@ jobs:
       fail-fast: false
       matrix:
         include:
-          - container: "ubuntu:hirsute"
-            env:
-              CC: gcc
+          # Does pass installation - hangs on tzdata configuration
+          # - container: "ubuntu:hirsute"
+          #   env:
+          #     CC: gcc
 
           - container: "ubuntu:focal"
             env:
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
