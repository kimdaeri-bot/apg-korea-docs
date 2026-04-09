#!/bin/bash

generate() {
local slug="$1"
local code="$2"
local nameko="$3"
local flag="$4"
local country="$5"
local hub="$6"
local alliance="$7"
local fleet="$8"
local founded="$9"
local routes="${10}"
local routes_list="${11}"
local intro_text="${12}"
local feature="${13}"
local image="${14}"
local hashtags="${15}"
local countrytag="${16}"

cat > "${slug}.html" << HTMLEOF
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${nameko} ${code} — APG Korea</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Apple SD Gothic Neo','Noto Sans KR',-apple-system,sans-serif;background:#0b0f19;color:#e0e4ed}
.back{display:inline-flex;align-items:center;gap:6px;color:#6e8efb;text-decoration:none;font-weight:600;font-size:.9rem;padding:20px 28px}
.back:hover{text-decoration:underline}
.hero{position:relative;overflow:hidden;background:#0b0f19}
.hero img{width:100%;height:auto;display:block;margin:0 auto;filter:brightness(.9)}
.content{max-width:760px;margin:0 auto;padding:0 20px 40px}
.copy-area{position:relative;background:#141825;border-radius:16px;padding:28px 30px;margin-bottom:20px;border:1px solid #1e2435;line-height:1.85;font-size:.95rem;white-space:pre-wrap;color:#b8c0d0}
.copy-area strong{color:#e0e4ed}
.copy-btn{position:absolute;top:12px;right:12px;background:#6e8efb;color:#fff;border:none;padding:6px 14px;border-radius:8px;font-size:.75rem;font-weight:700;cursor:pointer}
.copy-btn:hover{background:#5a7de8}
.copy-btn.copied{background:#22c55e}
.footer{text-align:center;padding:28px;color:#2a3555;font-size:.72rem;border-top:1px solid #141825}
</style>
</head>
<body>

<a class="back" href="../index.html">← APG Korea 문서함</a>

<div class="hero">
  <img src="${image}" alt="${nameko}">
</div>

<div class="content">
  <div class="copy-area" id="copyText">
    <button class="copy-btn" onclick="copyText()">📋 복사</button>✈️ ${nameko}

${flag} ${country}의 국적항공사, <strong>${nameko}</strong>을(를) 소개합니다!

${founded}년 설립된 ${nameko}은(는) <strong>${hub}</strong>을(를) 허브로 ${routes}을(를) 연결하는 항공사입니다.${alliance:+  <strong>${alliance}</strong> 소속으로 글로벌 네트워크의 혜택을 제공합니다.}

${intro_text}

🛫 허브 공항: ${hub}
🤝 동맹: ${alliance}
🛩️ 운용 기재: ${fleet}
🗺️ 취항지: ${routes_list}

📍 주요 노선: ${routes}

✨ ${feature}

📍${nameko}는(은) GP-275를 통해 예약 및 발권 가능하며, 전 세계 여행사들이 쉽게 접근할 수 있도록 APG가 함께합니다.

APG Korea는 전 세계 170개국, 100개 이상의 글로벌 네트워크를 기반으로 APG Airlines를 통해 ${nameko} (${code}) 항공권의 BSP 발권을 지원합니다.

📧 문의: sales@apg-ga.co.kr

${hashtags}</div>

</div>

<div class="footer">© 2026 APG Korea · Internal Use Only · kimdaeri-bot/apg-korea-docs</div>

<script>
function copyText(){
  const el=document.getElementById('copyText');
  const text=el.innerText.replace('📋 복사','').trim();
  navigator.clipboard.writeText(text).then(()=>{
    const btn=el.querySelector('.copy-btn');
    btn.textContent='✅ 복사됨!';
    btn.classList.add('copied');
    setTimeout(()=>{btn.textContent='📋 복사';btn.classList.remove('copied');},2000);
  });
}
</script>
</body>
</html>
HTMLEOF
}

# Middle East & Central Asia (17)
generate "air-astana" "KC" "Air Astana" "🇰🇿" "카자흐스탄" "알마티 국제공항 (ALA) / 누르술탄 나자르바예프 국제공항 (NQZ)" "" "A320, A321, A320neo, B767-300ER, B787-8, E190" "2002" "중앙아시아와 유럽·아시아 주요 도시" "알마티 ↔ 서울, 이스탄불, 두바이, 모스크바, 베이징, 런던, 프랑크푸르트 등" "카자흐스탄의 국적항공사이자 중앙아시아 최대 항공사입니다. 실크로드의 교차로에 위치한 허브를 기반으로 동서양을 잇는 전략적 노선망을 운영하며, 4스카이스타 평가를 받는 고품질 서비스를 제공합니다. 하늘과 초원을 상징하는 터키석 컬러의 기체가 인상적입니다." "중앙아시아 유일의 4스카이스타 항공사로, 최신 B787 드림라이너와 A320neo 기종으로 장거리 단거리 모두 컴포트 높은 서비스를 제공합니다. 카자흐스탄의 아름다운 자연과 유적지를 잇는 게이트웨이 역할을 합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Air_Astana_Boeing_767-3ER_P4-KBC_%28cropped%29.jpg/1280px-Air_Astana_Boeing_767-3ER_P4-KBC_%28cropped%29.jpg" "#AirAstana #카자흐스탄항공 #알마티 #중앙아시아여행 #APGKorea #GP275 #항공사소개" "카자흐스탄"

generate "arkia" "IZ" "Arkia Israeli Airlines" "🇮🇱" "이스라엘" "벤구리온 국제공항 (TLV)" "" "A320-200, A321-200, A321neo, B757-300, E195" "1950" "이스라엘 국내 및 유럽·중동 지역" "텔아비브 ↔ 파리, 런던, 로마, 아테네, 라르나카, 프라하, 베를린 등" "이스라엘 최초의 항공사로, 태생은 이스라엘 공군의 전신 조직에서 시작되었습니다. 반세기 이상 이스라엘의 하늘을 지켜온 항공사로, 엘알(EL AL)과 함께 이스라엘 항공 시장의 양대 산맥입니다." "엘알에 이은 이스라엘 2위 항공사로, 최신 A321neo 도입으로 유럽 레저 노선을 확대하고 있습니다. 사해·갈릴리 등 이스라엘 관광 노선도 운영합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Arkia_Airbus_A321-200_4X-AVB_-_Tel_Aviv_%28cropped%29.jpg/1280px-Arkia_Airbus_A321-200_4X-AVB_-_Tel_Aviv_%28cropped%29.jpg" "#Arkia #아르키아항공 #이스라엘여행 #텔아비브 #APGKorea #GP275 #항공사소개" "이스라엘"

generate "azerbaijan-airlines" "J2" "Azerbaijan Airlines" "🇦🇿" "아제르바이잔" "헤이다르 알리예프 국제공항 (GYD)" "" "A320-200, A320neo, A321-200, A321neo, B767-300ER, B787-8" "1992" "CIS 국가, 유럽, 중동, 아시아 40+ 도시" "바쿠 ↔ 이스탄불, 두바이, 모스크바, 런던, 파리, 프랑크푸르트, 테헤란, 서울 등" "카스피해의 진주 바쿠를 중심으로 코카서스 지역의 항공 교통을 주도하는 아제르바이잔 국적항공사입니다. 석유와 가스 부국의 국적항공답게 기체 관리와 서비스 수준이 높으며, 유럽과 아시아를 잇는 전략적 위치를 활용한 노선망을 갖추고 있습니다." "B787 드림라이너를 운용하는 코카서스 대표 항공사로, 바쿠의 화려한 현대 건축과 구시가지를 잇는 관광 교통의 핵심입니다. 서울 직항 노선도 운영하여 한국인 여행객 접근성이 높습니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Azerbaijan_Airlines_Boeing_787-8_Dreamliner_%28cropped%29.jpg/1280px-Azerbaijan_Airlines_Boeing_787-8_Dreamliner_%28cropped%29.jpg" "#AzerbaijanAirlines #아제르바이잔항공 #바쿠 #코카서스여행 #APGKorea #GP275 #항공사소개" "아제르바이잔"

generate "egyptair" "MS" "EgyptAir" "🇪🇬" "이집트" "카이로 국제공항 (CAI)" "Star Alliance" "A320, A320neo, A321, A330-200, A330-300, B777-300ER, B787-9" "1932" "중동, 아프리카, 유럽, 아시아 80+ 도시" "카이로 ↔ 서울, 도쿄, 런던, 파리, 로마, 프랑크푸르트, 뉴욕, 두바이, 이스탄불, 아디스아바바 등" "아프리카 대륙 최초이자 중동에서 가장 오래된 항공사 중 하나입니다. 피라미드와 고대 이집트 문명의 고향 카이로를 거점으로, 80년 이상의 역사를 자랑하는 아랍 세계의 대표 항공사입니다. 호루스의 눈을 형상화 한 로고는 고대 이집트의 위용을 상징합니다." "Star Alliance 소속으로 아프리카 항공사 중 가장 글로벌한 네트워크를 보유합니다. B787-9 최신 기체로 장거리 노선 컴포트를 극대화했으며, 서울 직항을 운영해 한국인 여행객에게도 인기 있는 항공사입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/SU-GDL_-_Boeing_787-9_Dreamliner_-_EgyptAir_-_BOM_%28cropped%29.jpg/1280px-SU-GDL_-_Boeing_787-9_Dreamliner_-_EgyptAir_-_BOM_%28cropped%29.jpg" "#EgyptAir #이집트항공 #카이로 #피라미드 #StarAlliance #APGKorea #GP275 #항공사소개" "이집트"

generate "flydubai" "FZ" "flydubai" "🇦🇪" "아랍에미리트" "두바이 국제공항 (DXB)" "" "B737-800, B737-8 MAX, B737-9 MAX" "2008" "중동, 아프리카, 중앙아시아, 유럽 110+ 도시" "두바이 ↔ 리야드, 제다, 쿠웨이트, 바그다드, 테헤란, 카불, 모스크바, 크라쿠프, 자그레브 등" "두바이를 기반으로 한 저가항공사이자 에미레이트 항공의 자매사입니다. 두바이 국제공항 제2터미널을 전용으로 사용하며, 중동에서 가장 빠르게 성장한 항공사 중 하나입니다. 라운지 서비스와 기내 엔터테인먼트 등 LCC 주답지 않은 프리미엄 서비스를 제공합니다." "B737 MAX 기종 대량 도입으로 연비와 탑승객 컴포트를 동시에 개선했습니다. 비즈니스 클래스에서는 수하물 40kg, 라운지 이용, 기내 식사가 포함되어 LCC와 FSC의 중간 포지셔닝을 구현합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Flydubai_Boeing_737-8_MAX_-_A6-FED_%28cropped%29.jpg/1280px-Flydubai_Boeing_737-8_MAX_-_A6-FED_%28cropped%29.jpg" "#FlyDubai #플라이두바이 #두바이여행 #아랍에미리트 #APGKorea #GP275 #항공사소개" "아랍에미리트"

generate "gulf-air" "GF" "Gulf Air" "🇧🇭" "바레인" "바레인 국제공항 (BAH)" "" "A320, A320neo, A321neo, B787-9" "1950" "중동, 유럽, 아시아 50+ 도시" "바레인 ↔ 런던, 파리, 프랑크푸르트, 이스탄불, 두바이, 리야드, 뭄바이, 방콕, 마닐라, 카라치 등" "중동에서 가장 오래된 항공사 중 하나로, 걸프 만의 항공 역사를 함께해 온 전통 있는 항공사입니다. 걸프 코오퍼레이션 시절 4개국(바레인·오만·카타르·UAE)의 공동 국적항공이었던 역사를 간직하고 있습니다." "중동의 숨겨진 보석 바레인을 대표하는 항공사로, 최신 B787-9와 A320neo 기종으로 간판을 새롭게 하고 있습니다. Falcon Flyer 프로그램과 걸프 공항 라운지 등 프리미엄 서비스가 특징입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Gulf_Air_Boeing_787-9_Dreamliner_A9C-FGA_%28cropped%29.jpg/1280px-Gulf_Air_Boeing_787-9_Dreamliner_A9C-FGA_%28cropped%29.jpg" "#GulfAir #걸프에어 #바레인 #중동여행 #APGKorea #GP275 #항공사소개" "바레인"

generate "jordan-aviation" "R5" "Jordan Aviation" "🇯🇴" "요르단" "암만 알리아 국제공항 (AMM)" "" "A320-200, A321-200, A310-300, A330-200, B737-300, B767-200ER" "2000" "중동, 아프리카, 아시아 정기·부정기" "암만 ↔ 두바이, 리야드, 지다, 바그다드, 쿠웨이트, 카이로, 이스탄불 등" "요르단 암만을 거점으로 운항하는 차터·정기 혼합 항공사입니다. 하지(Hajj)와 움라(Umrah) 순례 항공편으로 큰 역할을 하며, 중동 지역 부정기 운항 분야에서 높은 점유율을 보유합니다." "정기 노선 외에 하지 순례 항공, VIP 전세기, 군수송 등 다양한 비즈니스 모델을 운영하는 중동 특화 항공사입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Jordan_Aviation_Boeing_767-200ER_JY-JAV_%28cropped%29.jpg/1280px-Jordan_Aviation_Boeing_767-200ER_JY-JAV_%28cropped%29.jpg" "#JordanAviation #요르단항공 #암만 #요르단여행 #APGKorea #GP275 #항공사소개" "요르단"

generate "kam-air" "RQ" "Kam Air" "🇦🇫" "아프가니스탄" "카불 국제공항 (KBL)" "" "B737-300, B737-400, B737-500, A340-300, MD-83" "2003" "아프가니스탄 국내 및 인근 중앙아시아·중동" "카불 ↔ 두바이, 이슬라마바드, 데리, 마자르, 쿤두즈, 헤라트 등" "아프가니스탄 최대 민간 항공사로, 전후 복구 과정에서 탄생하여 아프간의 하늘을 잇는 항로를 개척한 항공사입니다. 험준한 힌두쿠시 산맥 너머로 고립된 지역들을 연결하는 중요한 역할을 합니다." "아프가니스탄 국내 항공 인프라의 핵심으로, 외부와의 교통로가 제한된 아프간 지역 주민들에게 필수적인 연결망을 제공합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Kam_Air_Boeing_737-400_at_Delhi_%28cropped%29.jpg/1280px-Kam_Air_Boeing_737-400_at_Delhi_%28cropped%29.jpg" "#KamAir #캄에어 #아프가니스탄 #카불 #APGKorea #GP275 #항공사소개" "아프가니스탄"

generate "kuwait-airways" "KU" "Kuwait Airways" "🇰🇼" "쿠웨이트" "쿠웨이트 국제공항 (KWI)" "" "A320, A320neo, A330-200, A330-800neo, B777-300ER, B787-9" "1953" "중동, 유럽, 아시아 30+ 도시" "쿠웨이트 시티 ↔ 런던, 파리, 프랑크푸르트, 이스탄불, 두바이, 뭄바이, 방콕, 마닐라, 뉴욕 등" "걸프 만의 부국 쿠웨이트 국적항공사로, 중동에서 세 번째로 오래된 항공사입니다. 쿠웨이트의 전통 문화를 기체 디자인과 기내 서비스에 담아내며, 걸프 만 전통 경쟁 항공사들과 구별되는 아랍 전통을 유지합니다." "B787-9와 A330neo 최신 기체를 대거 도입하여 간판을 새롭게 했습니다. 비즈니스 클래스에서 쿠웨이트 전통 커피와 과자를 제공하는 등 아랍 호스피탈리티가 돋보입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Kuwait_Airways_Boeing_777-300ER_%28cropped%29.jpg/1280px-Kuwait_Airways_Boeing_777-300ER_%28cropped%29.jpg" "#KuwaitAirways #쿠웨이트항공 #쿠웨이트 #중동여행 #APGKorea #GP275 #항공사소개" "쿠웨이트"

generate "middle-east-airlines" "ME" "Middle East Airlines" "🇱🇧" "레바논" "베이루트 라피크 하리리 국제공항 (BEY)" "SkyTeam" "A320, A320neo, A321, A330-200" "1945" "중동, 유럽, 아프리카 20+ 도시" "베이루트 ↔ 파리, 런던, 프랑크푸르트, 로마, 이스탄불, 카이로, 리야드, 두바이, 아부다비 등" "레바논의 국적항공사이자 중동에서 가장 오래된 항공사 중 하나입니다. 백향나무(Cedar)가 새겨진 기체 디자인은 레바논의 국가 상징입니다. SkyTeam 소속으로 글로벌 네트워크에 편입되어 있습니다." "중동의 파리라 불리는 베이루트를 거점으로, 레바논 디아스포라 커뮤니티와 관광객을 연결합니다. A320neo 최신 기종으로 단거리 노선 효율을 높였습니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Middle_East_Airlines_Airbus_A320-200_OD-MEA_%28cropped%29.jpg/1280px-Middle_East_Airlines_Airbus_A320-200_OD-MEA_%28cropped%29.jpg" "#MiddleEastAirlines #중동항공 #레바논 #베이루트 #SkyTeam #APGKorea #GP275 #항공사소개" "레바논"

generate "nesma-airlines" "NE" "Nesma Airlines" "🇸🇦" "사우디아라비아" "다무암 킹 파이살 국제공항 (DMM)" "" "A320, A320neo, A321neo" "2010" "사우디아라비아 국내 및 중동·유럽 정기·부정기" "다무암 ↔ 리야드, 제다, 카이로, 샤름엘셰이크, 이스탄불, 파키스탄 등" "사우디아라비아의 네스마 그룹 소속 항공사로, 정기 노선과 하지 순례 항공을 함께 운영합니다. 사우디 비전 2030에 발맞춰 사우디 내수 항공 시장에서 역할을 확대하고 있습니다." "A320neo 최신 기체로 사우디 국내 정기 노선과 중동 지역 부정기 항공을 병행합니다. 하지·움라 순례 시즌에는 대규모 수송 능력을 자랑합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Nesma_Airlines_Airbus_A320-200_HZ-NSA_%28cropped%29.jpg/1280px-Nesma_Airlines_Airbus_A320-200_HZ-NSA_%28cropped%29.jpg" "#NesmaAirlines #네스마항공 #사우디아라비아 #APGKorea #GP275 #항공사소개" "사우디아라비아"

generate "royal-jordanian" "RJ" "Royal Jordanian" "🇯🇴" "요르단" "암만 퀸 알리아 국제공항 (AMM)" "Oneworld" "A319, A320, A321, B787-8, E170, E175, E195" "1963" "중동, 유럽, 아시아, 북미 50+ 도시" "암만 ↔ 런던, 파리, 프랑크푸르트, 이스탄불, 두바이, 카이로, 베이루트, 뉴욕, 시카고, 방콕 등" "요르단 국적항공사로, 후세인 국왕이 직접 설립한 역사 깊은 항공사입니다. Oneworld 얼라이언스 소속으로, 페트라와 사해 등 요르단 세계유적 관광의 핵심 교통 수단입니다." "B787 드림라이너로 장거리 노선 컴포트를 높였고, Oneworld 소속으로 글로벌 마일리지와 라운지 혜택을 제공합니다. 페트라 여행객의 필수 항공사입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Royal_Jordanian_Boeing_787-8_%28cropped%29.jpg/1280px-Royal_Jordanian_Boeing_787-8_%28cropped%29.jpg" "#RoyalJordanian #로열요르단 #요르단여행 #암만 #페트라 #Oneworld #APGKorea #GP275 #항공사소개" "요르단"

generate "saudi-arabian-airlines" "SV" "Saudi Arabian Airlines (Saudia)" "🇸🇦" "사우디아라비아" "제다 킹 압둘아지즈 국제공항 (JED) / 리야드 킹 할리드 국제공항 (RUH)" "SkyTeam" "A320, A321neo, A330-300, B777-300ER, B787-10" "1945" "중동, 아프리카, 유럽, 아시아, 북미 90+ 도시" "리야드/제다 ↔ 서울, 뉴욕, 런던, 파리, 프랑크푸르트, 이스탄불, 두바이, 카이로, 자카르타, 마닐라 등" "사우디아라비아 국적항공사이자 중동 최대 규모 항공사 중 하나입니다. 사우디 왕실의 항공사로 출발했으며, 이슬람 성지 순례 하지·움라 수송의 핵심 역할을 합니다. SkyTeam에 2012년 가입했습니다." "B787-10 최신 기체를 대거 운용하며, 서울 직항 노선으로 한국인 관광객과 비즈니스 여행객의 접근성이 높습니다. 이슬람 전통에 기반한 기내 서비스가 특징입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Saudia_Boeing_787-10_Dreamliner_HZ-ARB_%28cropped%29.jpg/1280px-Saudia_Boeing_787-10_Dreamliner_HZ-ARB_%28cropped%29.jpg" "#Saudia #사우디항공 #사우디아라비아 #SkyTeam #APGKorea #GP275 #항공사소개" "사우디아라비아"

generate "scat-airlines" "DV" "SCAT Airlines" "🇰🇿" "카자흐스탄" "시姆켄트 국제공항 (CIT)" "" "B737-300, B737-500, B737-800, B757-200, CRJ-200" "1997" "카자흐스탄 국내 및 CIS·중동 부정기" "심켄트 ↔ 알마티, 누르술탄, 악타우, 아크투베, 모스크바, 두바이 등" "카자흐스탄 남부 심켄트를 거점으로 한 지역 항공사입니다. 카자흐스탄의 대도시 간 연결을 담당하며, 부정기 항공과 정기 노선을 병행 운영합니다." "카자흐스탄 지방 도시들을 잇는 중요한 지역 항공사로, 카자흐스탄 남부 관광(투르키스탄 등)의 접근성을 높이는 역할을 합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/SCAT_Airlines_Boeing_757-200_UP-B7505_%28cropped%29.jpg/1280px-SCAT_Airlines_Boeing_757-200_UP-B7505_%28cropped%29.jpg" "#SCATAirlines #SCAT항공 #카자흐스탄 #심켄트 #APGKorea #GP275 #항공사소개" "카자흐스탄"

generate "somon-air" "SZ" "Somon Air" "🇹🇯" "타지키스탄" "두샨베 국제공항 (DYU)" "" "B737-300, B737-800, B737-900" "2004" "타지키스탄 국내 및 CIS·중동·아시아" "두샨베 ↔ 알마티, 두바이, 이스탄불, 모스크바, 우파, 노보시비르스크, 베이징 등" "타지키스탄 국적항공사로, 파미르 고원과 톈산 산맥이 둘러싼 두샨베를 거점으로 운항합니다. 실크로드 고대 도시들의 현대적 연결망을 구축하는 항공사입니다." "타지키스탄 유일의 국제선 항공사로, B737-800 기종으로 중앙아시아·중동·러시아 노선을 연결합니다. 파미르 고원 등 타지키스탄 자연 관광의 핵심 교통 수단입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Somon_Air_Boeing_737-8AS_EY-731_%28cropped%29.jpg/1280px-Somon_Air_Boeing_737-8AS_EY-731_%28cropped%29.jpg" "#SomonAir #소몬에어 #타지키스탄 #두샨베 #APGKorea #GP275 #항공사소개" "타지키스탄"

generate "turkish-airlines" "TK" "Turkish Airlines" "🇹🇷" "튀르키예" "이스탄불 공항 (IST)" "Star Alliance" "A319, A320, A321, A321neo, A330-300, A350-900, B777-300ER, B787-9" "1933" "전 세계 340+ 도시 (126개국)" "이스탄불 ↔ 서울, 도쿄, 뉴욕, 런던, 파리, 프랑크푸르트, 두바이, 싱가포르, 시드니 등" "세계에서 가장 많은 국가에 취항하는 항공사입니다. 이스탄불이라는 유라시아의 교차로를 거점으로 유럽, 아시아, 아프리카, 아메리카를 한 곳에 연결합니다. 연간 8천만 명 이상의 승객을 수송하는 글로벌 대형 항공사입니다." "Star Alliance 소속으로 세계 최대 취항국가 수를 자랑하며, 서울 이스탄불 노선으로 한국인 여행객에게도 가장 친숙한 유럽 항공사입니다. 기내식, 엔터테인먼트, 수하물 정책이 모두 뛰어납니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Turkish_Airlines_Boeing_777-300ER_-_TC-JJZ_%28cropped%29.jpg/1280px-Turkish_Airlines_Boeing_777-300ER_-_TC-JJZ_%28cropped%29.jpg" "#TurkishAirlines #터키항공 #이스탄불 #StarAlliance #APGKorea #GP275 #항공사소개" "튀르키예"

generate "uzbekistan-airways" "HY" "Uzbekistan Airways" "🇺🇿" "우즈베키스탄" "타슈켄트 국제공항 (TAS)" "" "A320, A320neo, A321neo, B767-300ER, B777-200LR, B787-8" "1992" "중앙아시아, 유럽, 아시아 50+ 도시" "타슈켄트 ↔ 서울, 이스탄불, 두바이, 모스크바, 런던, 파리, 베이징, 방콕, 쿠알라룸푸르 등" "우즈베키스탄 국적항공사로, 실크로드의 핵심 도시 타슈켄트와 사마르칸트, 부하라 등을 잇는 항공사입니다. 소련 붕괴 후 독립 국가들의 항공사 중 가장 안정적으로 성장한 곳 중 하나입니다." "B787 드림라이너로 서울 직항을 운영해 한국인 관광객의 실크로드 여행 접근성이 높습니다. 사마르칸트, 부하라, 히바 등 세계유산 도시들의 관문입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Uzbekistan_Airways_Boeing_787-8_Dreamliner_UK-78708_%28cropped%29.jpg/1280px-Uzbekistan_Airways_Boeing_787-8_Dreamliner_UK-78708_%28cropped%29.jpg" "#UzbekistanAirways #우즈베키스탄항공 #타슈켄트 #실크로드 #APGKorea #GP275 #항공사소개" "우즈베키스탄"

# Africa (30)
generate "afrijet" "J7" "Afrijet" "🇬🇦" "가봉" "리브르빌 국제공항 (LBV)" "" "CRJ-100, CRJ-200, CRJ-900, ATR 42, ATR 72" "2004" "중앙아프리카 및 서아프리카" "리브르빌 ↔ 두알라, 브라자빌, 킨샤사, 야운데, 바타, 포트앤토 등" "가봉을 거점으로 중앙아프리카 지역을 연결하는 항공사입니다. 열대우림과 해안가의 소도시들을 잇는 중앙아프리카 항공 네트워크의 핵심입니다." "중앙아프리카 경제 공동체(CEMAC) 지역의 대표 항공사로, CRJ와 ATR 기종으로 열대 지역 소규모 공항 취항에 특화되어 있습니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Afrijet_Aviation_%28Cropper%29.jpg/1280px-Afrijet_Aviation_%28Cropper%29.jpg" "#Afrijet #아프리제트 #가봉 #중앙아프리카 #APGKorea #GP275 #항공사소개" "가봉"

generate "air-algerie" "AH" "Air Algérie" "🇩🇿" "알제리" "알제 후아리 부메디엔 국제공항 (ALG)" "" "A320, A320neo, A330-200, B737-600, B737-800" "1947" "유럽, 중동, 북아프리카 30+ 도시" "알제 ↔ 파리, 런던, 마르세유, 이스탄불, 두바이, 튀니스, 카사블랑카 등" "알제리 국적항공사이자 북아프리카 대형 항공사입니다. 지중해를 사이에 둔 유럽과 아프리카의 교차점에서 반세기 이상 운항해 왔습니다." "북아프리카 항공 시장의 핵심 플레이어로, A320neo 최신 기체로 유럽 노선 효율을 높였습니다. 프랑스와의 역사적 연결로 파리·마르세유 노선이 축입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Air_Alg%C3%A9rie_Boeing_737-800_%28cropped%29.jpg/1280px-Air_Alg%C3%A9rie_Boeing_737-800_%28cropped%29.jpg" "#AirAlgerie #알제리항공 #알제 #북아프리카 #APGKorea #GP275 #항공사소개" "알제리"

generate "air-burkina" "2J" "Air Burkina" "🇧🇫" "부르키나파소" "와가두구 공항 (OUA)" "" "B737-500, EMB-120" "1967" "서아프리카 10+ 도시" "와가두구 ↔ 아비장, 바마코, 아크라, 라고스, 코토누, 니아메 등" "부르키나파소 국적항공사로, 서아프리카 내륙국의 항공 교통을 담당합니다. 사헬 지역의 경제 중심지 와가두구를 거점으로 인근 서아프리카 국가들을 연결합니다." "서아프리카 경제 공동체(ECOWAS) 지역의 대표 항공사로, 내륙국 부르키나파소를 외부와 잇는 필수 교통 수단입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Air_Burkina_Boeing_737-500_%28cropped%29.jpg/1280px-Air_Burkina_Boeing_737-500_%28cropped%29.jpg" "#AirBurkina #에어부르키나 #부르키나파소 #서아프리카 #APGKorea #GP275 #항공사소개" "부르키나파소"

generate "air-cote-divoire" "HF" "Air Côte d'Ivoire" "🇨🇮" "코트디부아르" "아비장 펠릭스 후페부아 부아니 국제공항 (ABJ)" "" "A320, A319, Q300, Q400" "2012" "서아프리카 20+ 도시" "아비장 ↔ 라고스, 아크라, 바마코, 다카르, 브라자빌, 콩고, 리브르빌 등" "코트디부아르 국적항공사로, 서아프리카 경제 대국 아비장을 거점으로 운항합니다. 2000년대에 이전 국적항공이 폐업한 후 부활된 항공사로, 서아프리카 항공 시장 재편의 핵심입니다." "아비장 경제권의 항공망을 구축하며 서아프리카 지역 통합을 이끄는 항공사입니다. 최신 A320 기체로 서아프리카 지역 노선 효율을 개선했습니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Air_Cote_d%27Ivoire_Airbus_A319-132_%28cropped%29.jpg/1280px-Air_Cote_d%27Ivoire_Airbus_A319-132_%28cropped%29.jpg" "#AirCotedIvoire #코트디부아르항공 #아비장 #서아프리카 #APGKorea #GP275 #항공사소개" "코트디부아르"

generate "air-peace" "P4" "Air Peace" "🇳🇬" "나이지리아" "라고스 무르탈라 모하메드 국제공항 (LOS)" "" "B737-300, B737-500, B737-800, B777-200, B777-300, E195-E2" "2014" "나이지리아 국내 및 아프리카·유럽·아시아 20+ 도시" "라고스 ↔ 아부자, 포트하커트, 두바이, 조하네스버그, 런던, 몸바사, 인도 등" "나이지리아 최대 항공사이자 아프리카에서 가장 빠르게 성장하는 항공사 중 하나입니다. 아프리카 최대 인구국의 항공 시장을 이끌며, 최근 장거리 노선까지 확장하고 있습니다." "나이지리아 항공 시장 1위로, B777 기체로 두바이·런던 장거리 노선을 운항합니다. 최신 E195-E2 도입으로 단거리 효율도 높였습니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Air_Peace_Boeing_737-3H4_%28cropped%29.jpg/1280px-Air_Peace_Boeing_737-3H4_%28cropped%29.jpg" "#AirPeace #에어피스 #나이지리아 #라고스 #아프리카항공 #APGKorea #GP275 #항공사소개" "나이지리아"

generate "air-senegal" "HC" "Air Sénégal" "🇸🇳" "세네갈" "다카르 블레즈 디아뉴 국제공항 (DSS)" "" "A320, A320neo, A321neo, A330-300" "2016" "서아프리카, 유럽 20+ 도시" "다카르 ↔ 파리, 마르세유, 런던, 밀라노, 아비장, 라고스, 바마코, 카사블랑카 등" "세네갈 국적항공사로, 아프리카 서쪽 끝 다카르를 거점으로 서아프리카와 유럽을 잇습니다. 비교적 최근 설립된 신생 항공사지만, 서아프리카 항공 시장에서 빠르게 입지를 다지고 있습니다." "A330-300으로 파리·런던 장거리 노선을 운항하며, A320neo로 서아프리카 지역망을 구축합니다. 아프리카 르네상스 기획의 일환으로 설립된 국책 항공사입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Air_S%C3%A9n%C3%A9gal_Airbus_A320-214_6V-AJA_%28cropped%29.jpg/1280px-Air_S%C3%A9n%C3%A9gal_Airbus_A320-214_6V-AJA_%28cropped%29.jpg" "#AirSenegal #에어세네갈 #세네갈 #다카르 #서아프리카 #APGKorea #GP275 #항공사소개" "세네갈"

generate "air-seychelles" "HM" "Air Seychelles" "🇸🇨" "세이셸" "세이셸 국제공항 (SEZ)" "" "DHC-6 Twin Otter" "1977" "세이셸 국내 섬 노선" "마에 섬 ↔ 프라슬린, 라디그, 데로쉬, 베르드 등" "인도양의 보석 세이셸 국적항공사입니다. 115개의 산호섬으로 이루어진 세이셸 군도를 연결하며, 세계에서 가장 아름다운 해변으로 꼽히는 목적지들의 항공 교통을 담당합니다." "세이셸 국내 섬 간 연결에 특화된 항공사로, DHC-6 Twin Otter 소형기로 세이셸 군도의 오지 섬까지 운항합니다. 세계 최고의 허니문 목적지 접근성의 핵심입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Air_Seychelles_Twin_Otter_%28cropped%29.jpg/1280px-Air_Seychelles_Twin_Otter_%28cropped%29.jpg" "#AirSeychelles #에어세이셸 #세이셸 #인도양 #허니문 #APGKorea #GP275 #항공사소개" "세이셸"

generate "air-tanzania" "TC" "Air Tanzania" "🇹🇿" "탄자니아" "다르에스살람 줄리어스 니에레레 국제공항 (DAR)" "" "A220-100, A220-300, B787-8, DHC-8-400, CRJ-200" "1977" "탄자니아 국내 및 아프리카·아시아·유럽 15+ 도시" "다르에스살람 ↔ 아루샤, 음완자, 킬리만자로, 잔지바르, 케냐, 우간다, 인도, 중국 등" "탄자니아 국적항공사로, 아프리카 최고봉 킬리만자로와 세렝게티 사바나, 잔지바르 해변을 잇는 항공사입니다. A220 최신 기종을 대거 도입한 아프리카 항공사 중 하나입니다." "A220-300과 B787 드림라이너로 탄자니아 관광 인프라의 핵심을 담당합니다. 킬리만자로 산 정상 도전자와 세렝게티 사파리 여행객의 필수 항공사입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Air_Tanzania_Boeing_787-8_Dreamliner_HZ-T7819_%28cropped%29.jpg/1280px-Air_Tanzania_Boeing_787-8_Dreamliner_HZ-T7819_%28cropped%29.jpg" "#AirTanzania #에어탄자니아 #탄자니아 #킬리만자로 #세렝게티 #APGKorea #GP275 #항공사소개" "탄자니아"

generate "asky-airlines" "KP" "ASKY Airlines" "🇹🇬" "토고" "로메 나싱베 에야데마 국제공항 (LFW)" "" "B737-300, B737-500, B737-700, B737-800, Q400" "2010" "서아프리카 25+ 도시" "로메 ↔ 라고스, 아비장, 아크라, 쿠마시, 바마코, 와가두구, 킨샤사 등" "에티오피아 항공의 투자로 설립된 서아프리카 지역 항공사입니다. 서아프리카 국가 간 직항 연결 부족 문제를 해결하기 위해 탄생했으며, ECOWAS 지역 항공 통합의 상징입니다." "에티오피아 항공의 파트너십과 Q400 터보프롭으로 서아프리카 소형 공항 취항에 특화되어 있습니다. 아프리카 항공 연합(AfA) 네트워크의 서아프리카 핵심입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/ASKY_Airlines_Boeing_737-800_%28cropped%29.jpg/1280px-ASKY_Airlines_Boeing_737-800_%28cropped%29.jpg" "#ASKYAirlines #아스키항공 #서아프리카 #토고 #APGKorea #GP275 #항공사소개" "토고"

generate "ceiba-intercontinental" "C2" "Ceiba Intercontinental" "GQ" "적도기니" "말라보 국제공항 (SSG)" "" "B737-700, B737-800, B777-200, AN-24, AN-74" "2006" "중앙아프리카 및 유럽" "말라보 ↔ 두알라, 리브르빌, 킨샤사, 마드리드, 카사블랑카 등" "적도기니 국적항공사로, 석유 부국인 중앙아프리카의 말라보를 거점으로 운항합니다. 아프리카에서 드물게 B777 기체를 운용하는 소형 항공사입니다." "적도기니 국영 항공사로, B777 광체 기체와 함께 구소련 AN 시리즈 기체도 병행 운용하는 독특한 함대를 보유합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Ceiba_Intercontinental_Boeing_777-200ER_%28cropped%29.jpg/1280px-Ceiba_Intercontinental_Boeing_777-200ER_%28cropped%29.jpg" "#CeibaIntercontinental #세이바항공 #적도기니 #중앙아프리카 #APGKorea #GP275 #항공사소개" "적도기니"

generate "cemair" "5Z" "CemAir" "🇿🇦" "남아프리카공화국" "요하네스버그 OR 탬보 국제공항 (JNB)" "" "CRJ-100, CRJ-200, CRJ-700, CRJ-900, Dash 8-300" "2005" "남아프리카 국내 및 인근 아프리카 15+ 도시" "요하네스버그 ↔ 케이프타운, 더반, 이스트런던, 조지, 하르트비스포르트, 마세루, 마푸토 등" "남아프리카공화국의 지역 항공사로, CRJ 시리즈를 주력으로 남아프리카 내륙 소도시들을 연결합니다. 대형 항공사가 취항하지 않는 소규모 공항 노선에 특화되어 있습니다." "남아프리카 지역 항공망의 숨은 허리 역할을 하며, CRJ 기종으로 남아프리카의 오지 소도시와 리조트 지역까지 운항합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/CemAir_Canadair_Regional_Jet_CRJ-200_LR_%28cropped%29.jpg/1280px-CemAir_Canadair_Regional_Jet_CRJ-200_LR_%28cropped%29.jpg" "#CemAir #쎔에어 #남아프리카 #지역항공 #APGKorea #GP275 #항공사소개" "남아프리카공화국"

generate "daallo-airlines" "D3" "Daallo Airlines" "🇩🇯" "지부티" "지부티 앙부리 국제공항 (JIB)" "" "A320-200, B757-200, IL-76" "1991" "아프리카의 뿔, 중동" "지부티 ↔ 아디스아바바, 두바이, 나이로비, 모가디슈, 지부시 등" "아프리카의 뿔(Horn of Africa) 지역 항공사로, 지부티를 거점으로 홍해와 아덴만을 사이에 둔 전략적 위치에서 운항합니다." "아프리카의 뿔 지역에서 중동과 동아프리카를 잇는 항로를 담당하며, 화물 운송도 병행하는 다목적 항공사입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Daallo_Airlines_Boeing_757-200_%28cropped%29.jpg/1280px-Daallo_Airlines_Boeing_757-200_%28cropped%29.jpg" "#DaalloAirlines #다알로항공 #지부티 #아프리카의뿔 #APGKorea #GP275 #항공사소개" "지부티"

generate "eswatini-air" "RN" "Eswatini Air" "🇸🇿" "에스와티니" "마바바네/만지니 킹 마세와티 국제공항 (SHO)" "" "ERJ-145, ERJ-135" "2022" "남아프리카 지역" "만지니 ↔ 요하네스버그, 더반, 하라레, 마푸토 등" "에스와티니(구 스와질란드) 국적항공사로, 2022년에 설립된 아프리카에서 가장 새로운 항공사 중 하나입니다. 남아프리카 내륙 소국의 항공 자립을 목표로 탄생했습니다." "아프리카에서 가장 신설된 국적항공사로, ERJ 시리즈 소형기로 남아프리카 지역 노선을 운항하며 성장 초기 단계에 있습니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Eswatini_Air_EMB-135BJ_%28cropped%29.jpg/1280px-Eswatini_Air_EMB-135BJ_%28cropped%29.jpg" "#EswatiniAir #에스와티니에어 #에스와티니 #남아프리카 #APGKorea #GP275 #항공사소개" "에스와티니"

generate "ethiopian-airlines" "ET" "Ethiopian Airlines" "🇪🇹" "에티오피아" "아디스아바바 보레 국제공항 (ADD)" "Star Alliance" "A320, A320neo, A350-900, A350-1000, B737-800, B737 MAX 8, B777-200LR, B777-300ER, B787-8, B787-9" "1945" "전 세계 130+ 도시 (70+개국)" "아디스아바바 ↔ 서울, 도쿄, 상하이, 런던, 프랑크푸르트, 두바이, 케냐, 남아프리카, 미국 등" "아프리카 최대 항공사이자 세계 4대 대륙 항공사 중 하나입니다. 아프리카에서 가장 오래된 항공사로, 1945년 설립 이후 아프리카 항공 산업을 이끌어 왔습니다. A350-1000 등 최신 기체 대거 도입으로 글로벌 경쟁력을 확보했습니다." "Star Alliance 소속 아프리카 최대 항공사로, 서울 직항을 운영해 한국인 아프리카 여행객의 1순위 항공사입니다. 아프리카 50개 이상 국가에 취항해 사하라 이남 아프리카 어디든 연결 가능합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Ethiopian_Airlines_Boeing_787-8_Dreamliner_ET-AOR_%28cropped%29.jpg/1280px-Ethiopian_Airlines_Boeing_787-8_Dreamliner_ET-AOR_%28cropped%29.jpg" "#EthiopianAirlines #에티오피아항공 #아디스아바바 #StarAlliance #아프리카여행 #APGKorea #GP275 #항공사소개" "에티오피아"

generate "groupe-transair" "R2" "Groupe Transair" "🇸🇳" "세네갈" "다카르 요프 디옵 공항 (DSS)" "" "B737-300, B737-500" "2007" "서아프리카 10+ 도시" "다카르 ↔ 바마코, 아비장, 코나크리, 누아크쇼트, 카사블랑카 등" "세네갈의 민간 항공사로, 서아프리카 지역 저가 항공 시장에서 역할을 합니다. B737 클래식 기체로 서아프리카 도시 간 저렴한 연결을 제공합니다." "서아프리카 저가 항공 시장의 선두주자로, 지역 주민들의 이동 비용을 낮추는 역할을 합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Transair_Senegal_%28cropped%29.jpg/1280px-Transair_Senegal_%28cropped%29.jpg" "#GroupeTransair #트랑스에어 #세네갈 #서아프리카 #APGKorea #GP275 #항공사소개" "세네갈"

generate "ibom-air" "QI" "Ibom Air" "🇳🇬" "나이지리아" "우요 아크와 이봄 국제공항 (QUO)" "" "CRJ-900, A220-100, A220-300" "2013" "나이지리아 국내 10+ 도시" "우요 ↔ 라고스, 아부자, 포트하커트, 우요, 칼라바르, 베努埃 등" "나이지리아 아크와 이봄주 기반의 지역 항공사로, 나이지리아 국내 항공 시장에서 가장 빠르게 성장하는 항공사 중 하나입니다. A220 최신 기종을 아프리카 항공사 중 가장 먼저 도입한 곳입니다." "아프리카 항공사 최초로 A220 기체를 도입한 혁신적 항공사로, 탑승객 컴포트와 연비를 동시에 개선하며 나이지리아 국내 노선에서 입지를 확대하고 있습니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Ibom_Air_CRJ-900LR_%28cropped%29.jpg/1280px-Ibom_Air_CRJ-900LR_%28cropped%29.jpg" "#IbomAir #이봄에어 #나이지리아 #A220 #APGKorea #GP275 #항공사소개" "나이지리아"

generate "jambojet" "JM" "Jambojet" "🇰🇪" "케냐" "나이로비 조모 케냐타 국제공항 (NBO)" "" "B737-300, B737-800, DH8D-400" "2014" "케냐 국내 및 동아프리카 10+ 도시" "나이로비 ↔ 몸바사, 키수무, 엘도레트, 말린디, 람부, 음완자, 잔지바르 등" "케냐 항공(Kenya Airways)의 저가 자회사로, 케냐 국내와 동아프리카 지역을 저렴하게 연결합니다. 스와힐리어 인사 'Jambo'에서 이름을 따온 친근한 항공사입니다." "케냐 항공의 저가 자회사로, 몸바사 해변 휴양지와 마사이마라 사파리 접근성을 높이는 역할을 합니다. 동아프리카 최고의 저가 항공사로 성장 중입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Jambojet_Boeing_737-300_%28cropped%29.jpg/1280px-Jambojet_Boeing_737-300_%28cropped%29.jpg" "#Jambojet #잼보제트 #케냐 #몸바사 #동아프리카 #APGKorea #GP275 #항공사소개" "케냐"

generate "kenya-airways" "KQ" "Kenya Airways" "🇰🇪" "케냐" "나이로비 조모 케냐타 국제공항 (NBO)" "SkyTeam" "B737-700, B737-800, B787-8, E190" "1977" "아프리카, 유럽, 아시아 40+ 도시" "나이로비 ↔ 런던, 파리, 암스테르담, 두바이, 몸바사, 케이프타운, 요하네스버그, 방콕, 광저우 등" "케냐 국적항공사이자 동아프리카 대표 항공사입니다. '아프리카 날개(Pride of Africa)'라는 슬로건 아래 아프리카 항공 산업을 선도해 왔습니다. SkyTeam 소속으로 글로벌 네트워크에 편입되어 있습니다." "SkyTeam 소속 아프리카 대표 항공사로, B787 드림라이너로 장거리 노선 컴포트를 높였습니다. 마사이마라 사파리와 몸바사 해변을 잇는 관광 항공의 핵심입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Kenya_Airways_Boeing_787-8_Dreamliner_%28cropped%29.jpg/1280px-Kenya_Airways_Boeing_787-8_Dreamliner_%28cropped%29.jpg" "#KenyaAirways #케냐항공 #나이로비 #SkyTeam #마사이마라 #APGKorea #GP275 #항공사소개" "케냐"

generate "lam-mozambique" "TM" "LAM Mozambique Airlines" "🇲🇿" "모잠비크" "마푸토 국제공항 (MPM)" "" "B737-300, B737-500, B737-700, Q400, ERJ-145" "1936" "모잠비크 국내 및 남아프리카 지역 15+ 도시" "마푸토 ↔ 요하네스버그, 하라레, 나카라, 펨바, 베이라, 리셩게 등" "모잠비크 국적항공사로, 포르투갈 식민지 시절부터 운항한 아프리카 오래된 항공사 중 하나입니다. 인도양 연안의 마푸토를 거점으로 모잠비크 국내와 남아프리카 지역을 연결합니다." "모잠비크 국내 항공 인프라의 핵심으로, 해안가 관광 도시들과 남아프리카 경제권을 잇는 역할을 합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/LAM_Mozambique_Boeing_737-200_%28cropped%29.jpg/1280px-LAM_Mozambique_Boeing_737-200_%28cropped%29.jpg" "#LAMMozambique #람항공 #모잠비크 #마푸토 #인도양 #APGKorea #GP275 #항공사소개" "모잠비크"

generate "madagascar-airlines" "MD" "Madagascar Airlines" "🇲🇬" "마다가스카르" "안타나나리보 이바토 국제공항 (TNR)" "" "A320, ATR 72, DHC-6 Twin Otter, B777-300ER" "2023" "마다가스카르 국내 및 인도양·유럽 15+ 도시" "안타나나리보 ↔ 파리, 요하네스버그, 마우리티우스, 레위니옹, 노시베, 마잉가 등" "마다가스카르 국적항공사로, 2023년 이전 Air Madagascar을 재편하여 새롭게 출범했습니다. 세계 4대 섬 마다가스카르와 인도양 섬들을 연결합니다." "마다가스카르 독특한 생태계와 레무르 서식지를 잇는 항공사로, 인도양 관광 경제의 핵심 역할을 합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Air_Madagascar_Airbus_A340-300_%28cropped%29.jpg/1280px-Air_Madagascar_Airbus_A340-300_%28cropped%29.jpg" "#MadagascarAirlines #마다가스카르항공 #마다가스카르 #인도양 #APGKorea #GP275 #항공사소개" "마다가스카르"

generate "mauritania-airlines" "L6" "Mauritania Airlines" "🇲🇷" "모리타니" "누악쇼트 국제공항 (NKC)" "" "B737-500, B737-700, B737-800" "2004" "서아프리카 및 북아프리카 10+ 도시" "누악쇼트 ↔ 카사블랑카, 알제, 아비장, 바마코, 다카르, 누아크쇼트 등" "모리타니 국적항공사로, 사하라 사막 남부의 누악쇼트를 거점으로 서아프리카와 북아프리카를 연결합니다." "사하라 지역 항공 교통의 핵심으로, 모리타니와 인근 서아프리카 국가들을 연결하는 필수 항로를 담당합니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Mauritania_Airlines_Boeing_737-500_%28cropped%29.jpg/1280px-Mauritania_Airlines_Boeing_737-500_%28cropped%29.jpg" "#MauritaniaAirlines #모리타니항공 #모리타니 #사하라 #APGKorea #GP275 #항공사소개" "모리타니"

generate "precision-air" "PW" "Precision Air" "🇹🇿" "탄자니아" "다르에스살람 줄리어스 니에레레 국제공항 (DAR)" "" "ATR 42-500, ATR 72-500, ATR 72-600, B737-300" "1991" "탄자니아 국내 및 동아프리카 10+ 도시" "다르에스살람 ↔ 아루샤, 킬리만자로, 음완자, 잔지바르, 엔테베, 나이로비 등" "탄자니아 지역 항공사로, ATR 시리즈를 주력으로 탄자니아 국내와 동아프리카 지역을 연결합니다. 케냐 항공이 지분을 보유한 파트너 항공사입니다." "킬리만자로 산과 세렝게티 국립공원 접근의 핵심 항공사로, 탄자니아 사파리 여행의 필수 연결 수단입니다. ATR 72-600 최신 기종으로 서비스 품질을 개선했습니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Precision_Air_ATR_72-500_%28cropped%29.jpg/1280px-Precision_Air_ATR_72-500_%28cropped%29.jpg" "#PrecisionAir #프리시전에어 #탄자니아 #킬리만자로 #사파리 #APGKorea #GP275 #항공사소개" "탄자니아"

generate "royal-air-maroc" "AT" "Royal Air Maroc" "🇲🇦" "모로코" "카사블랑카 모하메드 V 국제공항 (CMN)" "Oneworld" "B737-700, B737-800, B787-8, B787-9, E190" "1957" "아프리카, 유럽, 중동, 북미 70+ 도시" "카사블랑카 ↔ 파리, 런던, 뉴욕, 몬트리올, 이스탄불, 지다, 두바이, 서울 등" "모로코 국적항공사이자 북아프리카 대표 항공사입니다. 아프리카-유럽 교차점인 모로코를 거점으로 대서양 양쪽을 연결합니다. 2020년 Oneworld 얼라이언스에 가입하여 글로벌 네트워크를 확장했습니다." "Oneworld 소속으로 아프리카 항공사 중 가장 프리미엄한 서비스를 제공합니다. B787 드림라이너로 뉴욕·몬트리올 노선을 운항하며, 모로코 관광의 핵심 교통 수단입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Royal_Air_Maroc_Boeing_787-9_Dreamliner_CN-RGA_%28cropped%29.jpg/1280px-Royal_Air_Maroc_Boeing_787-9_Dreamliner_CN-RGA_%28cropped%29.jpg" "#RoyalAirMaroc #로얄에어마로크 #모로코 #카사블랑카 #Oneworld #APGKorea #GP275 #항공사소개" "모로코"

generate "rwandair" "WB" "RwandAir" "🇷🇼" "르완다" "키갈리 국제공항 (KGL)" "" "A330-200, A330-300, B737-700, B737-800, CRJ-200, CRJ-900, Q400" "2002" "동아프리카, 중동, 유럽 25+ 도시" "키갈리 ↔ 나이로비, 요하네스버그, 두바이, 런던, 뮌헨, 브뤼셀, 아부다비 등" "르완다 국적항공사로, 아프리카에서 가장 빠르게 성장하는 항공사 중 하나입니다. 1000개의 언덕의 나라 르완다의 수도 키갈리를 거점으로 동아프리카 항공망의 핵심으로 부상하고 있습니다." "아프리카에서 가장 깨끗하고 안전한 국가로 꼽히는 르완다를 대표하며, A330 기체로 유럽·중동 장거리 노선을 운항합니다. 르완다의 고릴라 트레킹 관광 접근성의 핵심입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/RwandAir_Airbus_A330-300_9XR-WG_%28cropped%29.jpg/1280px-RwandAir_Airbus_A330-300_9XR-WG_%28cropped%29.jpg" "#RwandAir #르완다에어 #르완다 #키갈리 #고릴라트레킹 #APGKorea #GP275 #항공사소개" "르완다"

generate "south-african-airways" "SA" "South African Airways" "🇿🇦" "남아프리카공화국" "요하네스버그 OR 탬보 국제공항 (JNB)" "Star Alliance" "A319, A320, A330-200, A330-300, A340-300, A340-600" "1934" "아프리카, 유럽, 아시아, 북미 35+ 도시" "요하네스버그 ↔ 런던, 프랑크푸르트, 뮌헨, 퍼스, 뉴욕, 워싱턴, 두바이, 케이프타운, 더반 등" "아프리카 대륙 최초 항공사이자 남아프리카공화국 국적항공사입니다. 90년 이상의 역사를 자랑하며, 아프리카 항공 산업의 산 역사를 함께해 왔습니다. Star Alliance 소속입니다." "아프리카에서 가장 오래된 항공사로, 케이프타운·더반 등 남아프리카 주요 도시와 아프리카 대륙 각지를 연결합니다. Rainbow Nation의 자부심을 담은 항공사입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/South_African_Airways_Airbus_A340-300_%28cropped%29.jpg/1280px-South_African_Airways_Airbus_A340-300_%28cropped%29.jpg" "#SouthAfricanAirways #남아프리카항공 #요하네스버그 #StarAlliance #케이프타운 #APGKorea #GP275 #항공사소개" "남아프리카공화국"

generate "taag-angola-airlines" "DT" "TAAG Angola Airlines" "🇦🇴" "앙골라" "루안다 4 de Fevereiro 국제공항 (LAD)" "" "B737-700, B737-800, B777-200ER, B777-300ER, DHC-8-Q400" "1938" "아프리카, 유럽, 남미 25+ 도시" "루안다 ↔ 리스본, 런던, 파리, 두바이, 상파울루, 조하네스버그, 나미비아, 케이프타운 등" "앙골라 국적항공사이자 남부 아프리카 대형 항공사입니다. 대서양 연안 루안다를 거점으로 포르투갈과의 역사적 연결뿐 아니라 남미·남아프리카를 연결합니다." "B777 광체 기체로 유럽·남미 장거리 노선을 운항하는 아프리카 대형 항공사입니다. 루안다의 석유 경제를 배경으로 안정적인 운항 기반을 갖추고 있습니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/TAAG_Angola_Airlines_Boeing_777-300ER_%28cropped%29.jpg/1280px-TAAG_Angola_Airlines_Boeing_777-300ER_%28cropped%29.jpg" "#TAAGAngola #TAAG항공 #앙골라 #루안다 #APGKorea #GP275 #항공사소개" "앙골라"

generate "tacv-cabo-verde" "VR" "TACV Cabo Verde Airlines" "🇨🇻" "카보베르데" "사우 항공port (SID) / 프라이아 공항 (RAI)" "" "ATR 72-500, B737-300, B737-700" "1958" "카보베르데 국내 9개 섬 및 유럽 15+ 도시" "살 ↔ 리스본, 보르도, 런던, 밀라노, 포르투, 아말피 등" "대서양 한가운데 카보베르데 공화국 국적항공사로, 10개의 화산섬으로 이루어진 군도를 연결합니다. 'HCV'로 불리며 대서양 횡단 항로의 중간 기착지 역할을 합니다." "대서양의 잃어진 섬 카보베르데의 9개 거주 섬을 연결하는 유일한 항공사이자, 유럽과 아메리카를 잇는 대서양 항로의 중요한 거점입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/TACV_Cabo_Verde_Airlines_%28cropped%29.jpg/1280px-TACV_Cabo_Verde_Airlines_%28cropped%29.jpg" "#TACV #카보베르데항공 #카보베르데 #대서양 #APGKorea #GP275 #항공사소개" "카보베르데"

generate "uganda-airlines" "UR" "Uganda Airlines" "🇺🇬" "우간다" "엔테베 국제공항 (EBB)" "" "A320, A320neo, A330-800neo, CRJ-900" "2019" "동아프리카 및 중동 10+ 도시" "엔테베 ↔ 나이로비, 다르에스살람, 몸바사, 조하네스버그, 두바이, 뭄바이, 킨샤사 등" "우간다 국적항공사로, 2019년 부활된 새로운 국적항공사입니다. 빅토리아 호수 연안 엔테베를 거점으로 동아프리카를 연결합니다." "부활 후 A330-800neo 최신 기체를 도입하여 장거리 노선에 진출한 젊은 항공사입니다. 우간다의 고릴라 트레킹과 빅토리아 호수 관광 접근성의 핵심입니다." "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Uganda_Airlines_Airbus_A330-800neo_5X-CLN_%28cropped%29.jpg/1280px-Uganda_Airlines_Airbus_A330-800neo_5X-CLN_%28cropped%29.jpg" "#UgandaAirlines #우간다항공 #우간다 #엔테베 #고릴라트레킹 #APGKorea #GP275 #항공사소개" "우간다"

echo "Done! Created files:"
ls -1 *.html | grep -v index | wc -l
echo "New files created:"
ls -1 *.html | grep -v index | sort
