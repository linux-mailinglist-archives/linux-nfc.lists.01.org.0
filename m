Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F11CB41
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 17:00:08 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6F77421275446;
	Tue, 14 May 2019 08:00:07 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 3DC4A21CF25A5
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 08:00:06 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e15so7200403wrs.4
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 08:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=2pvT3lAALltVAXbytV/5gIoc1DBX2+lwiggdED4PDbo=;
 b=GSM0Qbva+99HW5NBSoYk8ao4yhvh9C/BTgXoeTpMeuiUe99/6+krl3DX5Y5uqT1Rh3
 gKUmKgEerOoc+6C+VZxe6xBBblt1P3ntKj3/XSwcTnL/t7GnpVi4xFUEghwRCDWWl+Fl
 JUg3WQ8pdZkEOO7MWrE+28zwbepHiI/xXhGpJ5sUOVjgrud0GIOD9Sk/1CR+xlDHD+pF
 9v3jzXMy6gO5LBeJnmh7y3XxNg7jrRWjNLRxYR7lFYZrZAaa9ROk9Xg3DBV2PhZfNMor
 mkldh5ugeqQ/GiJS4L8p+ZouqBJIeQjR47fgLW2YSFkzix4ZOV93ccJoblgtLnDNR3lg
 UMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=2pvT3lAALltVAXbytV/5gIoc1DBX2+lwiggdED4PDbo=;
 b=Ob77yKK4x70wXgcbkaDZRyYxBy30pfKmTBNlrag4C/NKaBh9GRWwvlBAf5KTFDHVte
 NN+dd3C4toQle/uCsGbVzO+mLu0kwUbsB2ee7UzSOt/Utj7XTOnvA5pAsqR/tIU9KLOZ
 LfgUsRZ+vDWbboCMVlIp6jBNMHNTdsY+P44HoRsz4Drpbh2U8QiOFCyuHHHM1plbQqVQ
 CezwLFVdRxKnfeJiDVHXd+z1hHEYR1zWW285WyLnq4J9T6IY86Qn0v/hWfqEt6XTw+9Y
 g0xcTZu0ltlA4jWbjmmVcwHE+iMRvvYgHbk4y4LEeVI4d74zRq50yIk/1yhbC7OqfKje
 iQvA==
X-Gm-Message-State: APjAAAWfF3QlspgWwkInFEzSXJqzP8uuaaK4Vjw9lx/fvN6ah2+Q3KHd
 MlC5Jo7cbgP2sqoW1HGvzOg8tHZ1QG0q7Q+jLzA=
X-Google-Smtp-Source: APXvYqzjnTeAKyvQ4GiU3X0L6I/He+CyTRcBHA5BmPBca9IKOaNAkqLuRGotYr8+0aQP+QVPDdTslxfFoi+2M/acSBM=
X-Received: by 2002:a5d:430f:: with SMTP id h15mr4128742wrq.132.1557846004796; 
 Tue, 14 May 2019 08:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
 <CA+icZUXDLQKyTH-_pPi7A2=Bu5ratwab930Fcecrdr4NtMnFcw@mail.gmail.com>
 <27f2ce02-8deb-384f-af10-7737b703770a@linaro.org>
In-Reply-To: <27f2ce02-8deb-384f-af10-7737b703770a@linaro.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 14 May 2019 16:59:53 +0200
Message-ID: <CA+icZUVaBdswfmRfbRtdVJY8ymeDOwDSFEf7G6jneqEmpW84bg@mail.gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [linux-nfc] NXP NFC version and ACPI
X-BeenThere: linux-nfc@lists.01.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: NFC on Linux <linux-nfc.lists.01.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nfc/>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=subscribe>
Reply-To: sedat.dilek@gmail.com
Cc: linux-nfc@lists.01.org, linux-wireless@vger.kernel.org,
 charles.gorand@effinnov.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

On Tue, May 14, 2019 at 10:17 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
[...]

Just for the records:

root@iniza:~# rfkill --output ID,TYPE
ID TYPE
 0 bluetooth
 1 nfc
 2 wlan
 3 bluetooth

root@iniza:~# rfkill list nfc
1: nfc0: NFC
        Soft blocked: no
        Hard blocked: no

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
