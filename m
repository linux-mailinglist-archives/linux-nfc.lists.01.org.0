Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ABD3C3EFE
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E60DD100EB83E;
	Sun, 11 Jul 2021 13:21:28 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 23492100EBB6A
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:27 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fx7-0001XP-Mc
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:25 +0000
Received: by mail-wr1-f69.google.com with SMTP id h104-20020adf90710000b029010de8455a3aso6153770wrh.12
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QhSeDGvqFoZEDSp2vAlljfekmO0nq75LswF+gc4V/+s=;
        b=N0qkFpH2zqv5E3vGejCK9IlnWgA3HheduVKr/aQJ7yEITd8hFI9Vpt6KyOmzfUGNRg
         HIjZniZEoz1OS9CTq9EcWXAIG7d3CHuTLI/ghVaVdbp+z2BMitVvniSCBxYY9IJI3u+s
         cm1y9jw70lw9AQS8WB8KVUwgVe68xsgVX/oZZD2Z4MZI/PE+TgUOKQcwkiCpjQXeZKXg
         smSv8QaHr7tY/p/pT92POEnKb+SzYwVGhE6cnYO+Jraf2hen5v5Jlt+GeHECGU6ZcND/
         m92BvuVPvDxqMmjoKIClEFt4uKcIgu0jRbEjvf0wPz8D5eg8UlHagZuwXFsNd8GqrVDP
         4IHA==
X-Gm-Message-State: AOAM53319RChWULAgqlNn9TscGNeOwKJX9P6tfG0e6mjfQIjksr20QuO
	i06T7YdeiJwIPH3wlHYwf5r1eOf1XaNi208J3htGOqWmoA8bnnwZS3LuvhsyJlVzHE31QsK0UAr
	1RF7yw2gohYtXASYewRRWn39qwhHs/dAlmQ==
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr10498208wmc.6.1626034885250;
        Sun, 11 Jul 2021 13:21:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7aj+DIi/e9NQRunxJdLD1Ard6lSDIZeMQR0DjFA4As+4PSU36Ju8IHXyZCLLwfAGpHspvYA==
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr10498194wmc.6.1626034885099;
        Sun, 11 Jul 2021 13:21:25 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:29 +0200
Message-Id: <20210711202102.18094-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: EQIT6PXWH3GVINVB3S4GCCTJCUWZJ7J6
X-Message-ID-Hash: EQIT6PXWH3GVINVB3S4GCCTJCUWZJ7J6
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 01/34] Drop empty NEWS
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EQIT6PXWH3GVINVB3S4GCCTJCUWZJ7J6/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are no news.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 NEWS | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 NEWS

diff --git a/NEWS b/NEWS
deleted file mode 100644
index e69de29bb2d1..000000000000
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
