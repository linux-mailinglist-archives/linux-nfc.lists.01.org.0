Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5605C37BEFC
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 15:56:10 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 18836100EBB6C;
	Wed, 12 May 2021 06:56:09 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=oneukum@suse.com; receiver=<UNKNOWN> 
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1BF7D100EBB6B
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 06:56:07 -0700 (PDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620827765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQa3n9TFzuvP31kbKmw7UvEUqGGt3ON7QhD32UT4nCc=;
	b=kpt7Vw1uKfI2STlhe+TtkrixKAyPKUAJUcvBxqz3+rF5yoMNy2NzVVTMldVhKGut514EBP
	lyLrn06dikPecRoeaUhdKwru6AvhUJsH3Ipusta3OH0lhj6ukfA2HiY5yEMgMzgkRxfJ9/
	ZyUJUriHZsciJQ3Kdab0EEvi51Aj1hk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 26F20AE27;
	Wed, 12 May 2021 13:56:05 +0000 (UTC)
Message-ID: <a5eda19c63b1aef7141f2814109eb969020ca650.camel@suse.com>
From: Oliver Neukum <oneukum@suse.com>
To: clement.perrochaud@effinnov.com, charles.gorand@effinnov.com,
	linux-nfc@lists.01.org, netdev@vger.kernel.org
Date: Wed, 12 May 2021 15:56:04 +0200
In-Reply-To: <20210512134413.31808-1-oneukum@suse.com>
References: <20210512134413.31808-1-oneukum@suse.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Message-ID-Hash: CXGSM5KGPLR64CBOJ3V43LO4QKLHWNT2
X-Message-ID-Hash: CXGSM5KGPLR64CBOJ3V43LO4QKLHWNT2
X-MailFrom: oneukum@suse.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: cooperation with runtime PM
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/CXGSM5KGPLR64CBOJ3V43LO4QKLHWNT2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 12.05.2021, 15:44 +0200 schrieb Oliver Neukum:
> We cannot rely on the underlying hardware to do correct
> runtime PM. NFC core needs to get PM reference while
> a device is operational, lest it be suspended when
> it is supposed to be waiting for a target to come
> into range.
> 

Sorry for sending this out with an uncompleted change log.
It went out unintentionally early.

	Regards
		Oliver

_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
