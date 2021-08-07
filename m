Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B6A3E3703
	for <lists+linux-nfc@lfdr.de>; Sat,  7 Aug 2021 22:08:43 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E611E100EB33A;
	Sat,  7 Aug 2021 13:08:38 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BB9AC100EB338
	for <linux-nfc@lists.01.org>; Sat,  7 Aug 2021 13:08:36 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 9E88C5C007C;
	Sat,  7 Aug 2021 16:08:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 07 Aug 2021 16:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=wXTmEWkGfiqAMzTAk2XIak6OTDx
	X2W/MEGofRnUtHLk=; b=hXGbRztkgA8GNaCqHcWuP18BcNEk2aLI07XYeuVK3+J
	oULYNUddwuTTSDIVdmHAzide6dmlBCniOohfi1dWNXAZ+e8zJIOHbZgXJhdgmoi7
	6062f2N7AuqCvemPMLBn6ITO/+JOOMSG04bMztxx7oDf6LYRUnvgHdIbB+9Z7+d1
	ImFhU+rQ9sSEy5cQ8kNmeq2JycM3Ix/ao8oX/DNOP7gCksSzpNiv2QlEv4U8wdUB
	Lcq42Dj8gcdxNbreza2XKLxjDwMALaCj26MuMfCeHiSWuGFI7XNkMigyzJxAHYT+
	cwT+MvEDbp7xx6tykxpzhs/rH6uZXTaQdDYdkj4kadw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wXTmEW
	kGfiqAMzTAk2XIak6OTDxX2W/MEGofRnUtHLk=; b=IXJnK0x15MAC3wW3sJsBi6
	iwotEGUzSPCgHfrvDzb3Ivm2Olse1/DjBF7trWL7TxbhG25TnWX7eHDusknCB5ll
	SMlonrNro6uWrghx1AGrl5WKoB/GrGyM87AU+sxZ933Spanqm2Hi2QYUUgaZrzCz
	TiY0LPyOAQt7YWVO3p3V120AsoN5BITYSD5gkIQf6AmNAgMDuVgJjnQLtVukx5uk
	AbOA0GJdzBxySMlHbsbkAMLQ8PYcvgb2LfXp4rH6sNajsRmRUqTCYBVtBwsy7fNa
	wA4I/iufa1K9xGAzdAyDiVTZI1o+zJZdLAHDdkD3ns37yZh34jxWZImbPuh8GB4w
	==
X-ME-Sender: <xms:QugOYRAzJbL8ubpXgz6mSZ_JYlUhSaIIi3--R7CwQv7u1TeIzF2Q4g>
    <xme:QugOYfg5bYCIp_kn55h4xXgeWPtdOTOjuYlBIfJ83c32J4PvW5VFyucXh0ydNtUcG
    2ojIb7IDtW8Gon_ng>
X-ME-Received: <xmr:QugOYcnWlkiN7ds62zDYgI-ubyFR9XTE_Qk0pwLyhnq97vSFVk6bMFUjlXRiD2wka4w41H7wI8gVuE-hGebMjFkRwNb-3SsAzmQnFW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeefgddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpedujeelgeejleegleevkeekvdevudfhteeuiedtleehtdduleelvdei
    fffhvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgvvghrsegrnhhimhgrlhgt
    rhgvvghkrdgtohhm
X-ME-Proxy: <xmx:QugOYbx1YQGaEvdOlJrRZ5t3pWYfHsrnKWZSXzjjw-xf1eucJKPEwQ>
    <xmx:QugOYWTN2fMM9U395VE3vED9nxIghOppSTm_Z8IB0LfqIWOwPR830w>
    <xmx:QugOYebnWhOmYs8IaOMg9vkT9k4E62DcDmNkNAmFPdQq3gAA-vgbag>
    <xmx:Q-gOYZL8MpnguY3j-ZhXOQlLbZm6DGq5DR-MzeRnsPGl98Jg7FPo3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Aug 2021 16:08:34 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 03994136009E; Sat,  7 Aug 2021 13:08:32 -0700 (MST)
Date: Sat, 7 Aug 2021 13:08:32 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210807200832.GA124928@animalcreek.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: DOWI2URAGG4NCRU2SIUT43MWAB4DB6Y6
X-Message-ID-Hash: DOWI2URAGG4NCRU2SIUT43MWAB4DB6Y6
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH v2 00/11] CI under Github
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DOWI2URAGG4NCRU2SIUT43MWAB4DB6Y6/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 04, 2021 at 10:42:07AM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Add a Continuous Integration builds under Github (with its Actions) to
> build and unit test on several configurations.
> 
> Changes since v1 [1]:
> 1. Rebase on latest master.
> 2. Remove CI-unrelated patches from this set.
> 3. Add CodeQL analysis.
> 4. Add builds and tests with GCC sanitizers.
> 5. Use matrix to extend the build configuration.
> 
> [1] https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlowski@canonical.com/
> 
> 
> Best regards,
> Krzysztof

Applied.

Thank you.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
