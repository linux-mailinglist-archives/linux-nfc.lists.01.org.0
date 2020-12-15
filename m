Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 256142DA692
	for <lists+linux-nfc@lfdr.de>; Tue, 15 Dec 2020 04:01:54 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 901EE100EC1D7;
	Mon, 14 Dec 2020 19:01:52 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 00573100EC1CF
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 19:01:49 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id o17so32626176lfg.4
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 19:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2v5zQ4ASqwUEaImz7xFZXnky0JeRmzUKfNWkHn9qJfM=;
        b=GFwc/SmQThkfuiijlhBZC/sL7/Mh9X0gSRoxzCiFmWN7uXQlyORRlUa8F7MVTsRLZw
         MjvFn/0ePlj1h79IHnldGV0sRP89Z7tc8ECMEVBv3B8zKqD5dD5GyuoDkqL8onj8GKHX
         9SoUFrxHFWczz56aY67YAu5OK4hK/FlcV0cOA70tnjbu5uYzXZmLz/Eq8imDs6iG4jvh
         rw0PA24KGL2yjKHXkdJiTYfjwp8qwuQvFqtLLErxpApES3wLwrdNyjRgPFn8nV+VCRwp
         v+XZvTQdfADTHOrUd7f+A913L32vYpDFsP7PpzizvOApaQbT2yHGn/fSNZIK6UkanxTw
         NYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2v5zQ4ASqwUEaImz7xFZXnky0JeRmzUKfNWkHn9qJfM=;
        b=mXoTEYqg/5d0hUqVicYDqpGcgiO797uZ5E4PUE4O0JUmAgDz2P709ck4adLG4L4GoR
         phfylblOQLMgWZAhhopQWLL7T3cHfNkXZuodv0vQkQiV0dy1YweYRqOm3XOLFw8cpX4d
         oCEbp5374sA5qfl9DMxhPTRBah0zbEtqJpTSYJKILsIlO87mrOKEsSMACzUlH0q3kepi
         XaMwrF3Fqd5R+98Cb1ux/NypsvcC9YL31O1XeWyldaB1U2QHdDYuVJ2aq9fe1E+smzyU
         2Hp1ipqYfHD4RksexxUWodfv4WXE3UFH40JaU7PnYJJH30XWNj366YR91T2wi6irfg3B
         NttQ==
X-Gm-Message-State: AOAM530J/uco37maCkB6xBLvWqRewRC+DO3Jh07sUDFgdgU1PXBK4DnS
	lDF2RRrhsz2d7ZhJHRtW5klqFuOrzifoeNJ1AbE=
X-Google-Smtp-Source: ABdhPJzb2LVI/Hael6CXe7Dd9N0jB+vHDofiXD9LcZUelPja+WQVgBFG0Fb0ZKnSnTDR/IdvA1iYa1tHnAMmK+oBzSQ=
X-Received: by 2002:a05:651c:1255:: with SMTP id h21mr12465905ljh.8.1608001306008;
 Mon, 14 Dec 2020 19:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20201214122823.2061-1-bongsu.jeon@samsung.com> <20201214154444.GA2493@kozik-lap>
In-Reply-To: <20201214154444.GA2493@kozik-lap>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Tue, 15 Dec 2020 12:01:34 +0900
Message-ID: <CACwDmQA5xVvyyO21t5meyJr7fbTa4sFwMR-dECJ01Cb6qrh5OA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID-Hash: 7M2R7RV2X65LPFDUUPOQSSS7JZ5UE75T
X-Message-ID-Hash: 7M2R7RV2X65LPFDUUPOQSSS7JZ5UE75T
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] MAINTAINERS: Update maintainer for SAMSUNG S3FWRN5 NFC
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7M2R7RV2X65LPFDUUPOQSSS7JZ5UE75T/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 15, 2020 at 12:44 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Dec 14, 2020 at 09:28:23PM +0900, Bongsu Jeon wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > add an email to look after the SAMSUNG NFC driver.
>
> Hi Bongsu,
>
> Review and testing is always appreciated. However before adding an entry
> to Maintainers, I would prefer to see some activity in maintainer-like
> tasks. So far there are none:
> https://lore.kernel.org/lkml/?q=f%3A%22Bongsu+Jeon%22
>
> Contributing patches is not the same as maintenance. Please subscribe to
> relevant mailing lists and devote effort for improving other people
> code.
>
> We had too many maintainers from many companies which did not perform
> actual maintainership for long time and clearly that's not the point.
>
> Best regards,
> Krzysztof

Ok, I  understand it.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
