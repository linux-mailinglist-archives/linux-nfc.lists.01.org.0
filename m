Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F13CB5B4
	for <lists+linux-nfc@lfdr.de>; Fri, 16 Jul 2021 12:09:03 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id EE026100EBB92;
	Fri, 16 Jul 2021 03:08:59 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B4FB2100EBB81
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:08:57 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id DEBF2408AB
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626430135;
	bh=Q2Tlz+cpTdZSosCkdNkKpK/0rRGlbAqp0eBZdGUQGVs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=CIegsCaX+I+1mM5JqGoSAr0ejDb/DnAuep9kndhsozrj9ITvauslFMjtYLaxQ45IT
	 od7dxxbmLwk22VT8BjqDAtJS2fpJ0Lw7LE0jDBBrAwV9Dd/gYSFLbiSk6EjSb2//NQ
	 lk6AO4uV9CsJNsmMbTTOt4aCLcTcU7H78lja3zuq4zyKocbTsVXZQnTC+OlN1xSkUI
	 gHcNljxkVrlAg2iB0aLwKoc35POCwytc/w7NDMko4buWzKnBQZNrmJCdXZIF8GIaVG
	 HMf6pF/M844xAmltmhEKC34H3/P3wUTLaxMtPdCPDkYnXxzFrjEA1EPX5JS86Q7PqO
	 pVoyrDLZhl1jw==
Received: by mail-ed1-f71.google.com with SMTP id s6-20020a0564020146b029039578926b8cso4544601edu.20
        for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q2Tlz+cpTdZSosCkdNkKpK/0rRGlbAqp0eBZdGUQGVs=;
        b=c+6Ez5xAPpYEb2pLCM1GrHWn18OAVmV0/IKV4nr12MW2iHWxxl7AiiJmVIg8K2FE1l
         bEoK/dadX/fVjuHcrZdZ6RB8ki4wSs4iYrIqGB3S9QXK9bCJ+qushk9Dh7k1x3H644C/
         h1yLL45GYNqGAicC9CwYrC6Eph7Ut7sYQ1pYt2638gn//rLsdWMC/noQgW3ZKz+afnjl
         kivXU7oUvVmM4vegwq2izaDzdHDlQ0qQicPKrN8FkPcKJPDzQEovPhpf6e5ItPTpgJds
         37veygcC5D2/cdgwilU3szEzTO4ZaQc8XqffI3gq3VDFbpNuP+pAmnWouVzOEtB3xOX4
         ffvw==
X-Gm-Message-State: AOAM5318M0UOWKfptEcMd627VTRTnb4HRi10k/XYWlS2nTIdEXJ7hXeg
	trCafRQbY8LHCb7cHEsUd7iODT3eAC4KT3uTMYOI16TIO8K/7kBI8UpnZEdqSVphC2cf2hX0qE8
	37uuCOi+4LiQ8h8pAzeMSwD960DJuKXcyKA==
X-Received: by 2002:a05:6402:204:: with SMTP id t4mr13461123edv.34.1626430135347;
        Fri, 16 Jul 2021 03:08:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWMZcZKsBEsP/srfhmJK+DkukWPlEGiGgPH/p5JFLZCvdN+dmVc1g5gKbfJHiZWijOxRcz0w==
X-Received: by 2002:a05:6402:204:: with SMTP id t4mr13461087edv.34.1626430135049;
        Fri, 16 Jul 2021 03:08:55 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id u26sm2710389ejj.4.2021.07.16.03.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 03:08:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Fri, 16 Jul 2021 12:08:37 +0200
Message-Id: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: XL5YUPUL6IVAUGLBVN3I5J2CQRSQI7OQ
X-Message-ID-Hash: XL5YUPUL6IVAUGLBVN3I5J2CQRSQI7OQ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 0/7] Fixes for more memory issues
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XL5YUPUL6IVAUGLBVN3I5J2CQRSQI7OQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Few memory leaks (not finished - test-snep-read has still one which
I don't know how to fix yet), one memory corruption and minor
improvements:

This is on top of my previous patchsets (from latest):
1. -Wformat=2 and few memory leaks
   https://lore.kernel.org/linux-nfc/20210714110518.104655-1-krzysztof.kozlowski@canonical.com/T/#t

2. fixes and improvements for neard (continued)
   https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlowski@canonical.com/T/#t

3. neard CI under Github and rouund of fixes
   https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlowski@canonical.com/T/#t

The patchset is also available on:
https://github.com/krzk/neard
branch: dev-asan-ubsan-continued

Best regards,
Krzysztof


Krzysztof Kozlowski (7):
  snep: do not open-code freeing ndef message
  unit: fix memory leaks in test-ndef-build
  snep: remove useless NULL-ify of local pointer variable
  snep: fix double free of GSList
  unit: fix memory leaks in test-snep-read error paths
  unit: fix record memory leak in test-snep-read
  unit: fix records GList memory leak in test-snep-read

 src/snep.c             | 10 ++--------
 unit/test-ndef-build.c |  6 ++++++
 unit/test-snep-read.c  | 11 ++++++++---
 unit/test-utils.c      |  8 --------
 unit/test-utils.h      |  2 --
 5 files changed, 16 insertions(+), 21 deletions(-)

-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
