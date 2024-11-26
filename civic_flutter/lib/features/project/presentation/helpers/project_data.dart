final Map<String, List<String>> projectCategories = {
  "Infrastructure Development": [
    "Roads and Highways",
    "Railways",
    "Ports and Harbors",
    "Airports",
    "Water Supply",
    "Public Buildings",
    "Bridges and Tunnels",
    "Urban Transport Systems"
  ],
  "Housing and Urban Development": [
    "Affordable Housing",
    "Urban Renewal",
    "Public Parks",
    "Smart Cities",
    "Slum Rehabilitation",
    "Green Spaces Development",
    "Community Centers"
  ],
  "Healthcare and Public Health": [
    "Hospital Construction",
    "Vaccination Programs",
    "Disease Prevention",
    "Emergency Response Systems",
    "Mobile Clinics",
    "Health Awareness Campaigns",
    "Medical Research Facilities",
    "Mental Health Programs"
  ],
  "Education and Training": [
    "School Construction",
    "Digital Literacy",
    "Scholarships",
    "Vocational Training",
    "Teacher Training Programs",
    "E-Learning Platforms",
    "University Infrastructure",
    "Special Education Programs"
  ],
  "Environment and Natural Resources": [
    "Conservation Projects",
    "Water Management",
    "Climate Change Initiatives",
    "Pollution Control",
    "Afforestation and Reforestation",
    "Wildlife Protection",
    "Sustainable Agriculture",
    "Soil Conservation"
  ],
  "Energy and Power": [
    "Power Generation",
    "Transmission Networks",
    "Rural Electrification",
    "Energy Efficiency Programs",
    "Smart Grids",
    "Renewable Energy (Solar, Wind, etc.)",
    "Battery Storage Facilities",
    "Nuclear Energy Development"
  ],
  "Agriculture and Rural Development": [
    "Irrigation Systems",
    "Farm Mechanization",
    "Soil Conservation",
    "Rural Roads",
    "Agricultural Research Centers",
    "Crop Insurance Programs",
    "Farmer Education Programs",
    "Market Access Programs"
  ],
  "Transportation and Logistics": [
    "Public Transportation",
    "Freight Hubs",
    "Multi-modal Transport",
    "Road Safety Programs",
    "High-Speed Rail",
    "Logistics and Warehousing",
    "Traffic Management Systems",
    "Bus Rapid Transit (BRT)"
  ],
  "Social Welfare": [
    "Food Security",
    "Poverty Alleviation",
    "Women and Child Welfare",
    "Disability Support",
    "Elderly Care Programs",
    "Homeless Assistance",
    "Social Housing",
    "Community Development"
  ],
  "Information Technology": [
    "E-Governance Platforms",
    "Digital ID Systems",
    "Cybersecurity",
    "Broadband Expansion",
    "Public Wi-Fi",
    "Mobile Payment Systems",
    "Data Centers",
    "Telecom Infrastructure"
  ],
  "Defense and National Security": [
    "Military Infrastructure",
    "Border Security",
    "Defense Technology Research",
    "Cyber Defense",
    "Intelligence Gathering",
    "Anti-Terrorism Programs",
    "Disaster Preparedness",
    "Emergency Response Systems"
  ],
  "Law and Justice": [
    "Court Infrastructure",
    "Prison Reform",
    "Public Defenders and Legal Aid",
    "Police Training Programs",
    "Community Policing",
    "Judicial System Modernization",
    "Victim Support Programs",
    "Anti-Corruption Initiatives"
  ],
  "Tourism and Cultural Heritage": [
    "Historical Site Preservation",
    "Tourist Infrastructure",
    "Cultural Festivals",
    "Community-based Tourism",
    "Museum Development",
    "Heritage Conservation",
    "Archaeological Research",
    "National Parks Development"
  ],
  "Economic Development and Trade": [
    "Industrial Parks",
    "Business Incubation",
    "Trade Facilitation",
    "Export Promotion",
    "Microfinance Programs",
    "Small Business Support",
    "Startup Funding",
    "Financial Literacy Programs"
  ],
  "Water Resources and Irrigation": [
    "Dams and Reservoirs",
    "Canals and Waterways",
    "Flood Control",
    "Groundwater Recharge",
    "Watershed Management",
    "Irrigation Infrastructure",
    "Rural Water Supply",
    "Rainwater Harvesting"
  ],
  "Public Safety and Emergency Services": [
    "Disaster Management",
    "Fire Station Construction",
    "Ambulance Services",
    "Public Warning Systems",
    "Emergency Shelters",
    "Search and Rescue",
    "Civil Defense Training",
    "Medical Response Units"
  ],
  "Science, Research, and Innovation": [
    "Research and Development Centers",
    "Technology Incubation",
    "Space Research",
    "Biotechnology",
    "Medical Research",
    "Clean Energy Research",
    "Artificial Intelligence",
    "Quantum Computing Research"
  ],
  "Financial Services and Inclusion": [
    "Banking Access Programs",
    "Microfinance",
    "Mobile Payments",
    "Financial Literacy",
    "Pension Programs",
    "Insurance for Low-Income Groups",
    "Blockchain for Financial Services",
    "Digital Wallet Initiatives"
  ],
  "Urban and Regional Planning": [
    "Land Use Planning",
    "Zoning and Regulation",
    "Regional Growth Plans",
    "Smart City Infrastructure",
    "Transport-Oriented Development",
    "Urban Green Spaces",
    "Housing for Migrants",
    "City Master Plans"
  ],
  "Youth Development and Sports": [
    "Sports Facilities",
    "Youth Leadership Programs",
    "Community Recreation Centers",
    "Athletic Training Programs",
    "National Sports Teams",
    "Youth Employment Initiatives",
    "Youth Entrepreneurship",
    "Community Clubs"
  ],
  "Telecommunications and Connectivity": [
    "5G Infrastructure",
    "Fiber Optic Expansion",
    "Rural Connectivity",
    "Public Internet Access",
    "Telecom Towers",
    "Digital Divide Reduction",
    "Emergency Communication Systems",
    "IoT Infrastructure"
  ],
  "Climate Action and Sustainability": [
    "Carbon Emissions Reduction",
    "Renewable Energy",
    "Climate Resilience Programs",
    "Green Building Standards",
    "Sustainable Transportation",
    "Zero-Waste Initiatives",
    "Carbon Sequestration",
    "Sustainable Agriculture"
  ],
  "Public Policy and Governance": [
    "Governance Reforms",
    "Transparency Initiatives",
    "Policy Research",
    "Citizen Engagement Platforms",
    "Public Participation",
    "Anti-Corruption Programs",
    "Government Efficiency",
    "Public Consultation Programs"
  ]
};

final sectionNames = [
  'Overview',
  'Category',
  'Status',
  'Funding',
  'Location',
  'Attachments',
];

final projectStatus = [
  'Planning',
  'Ongoing',
  'Completed',
];

final Map<String, List<String>> fundingSources = {
  "Government and Public Funds": [
    "National Budget Allocations",
    "Federal government budget",
    "State/provincial government budget",
    "Local government budget",
    "Special Government Funds",
    "Infrastructure Development Fund",
    "Sovereign Wealth Fund",
    "Social Welfare Fund",
    "Climate Action Fund",
    "Taxes and Levies",
    "Property tax",
    "Value-added tax (VAT)",
    "Corporate income tax",
    "Excise duties",
    "Environmental levies",
    "Government Grants",
    "Research and innovation grants",
    "Public health and education grants",
    "Development aid from government agencies",
    "State-Owned Enterprises (SOEs)",
    "Utilities companies (electricity, water, transportation)",
    "National oil and gas corporations",
    "Postal services"
  ],
  "International and Multilateral Organizations": [
    "Multilateral Development Banks (MDBs)",
    "World Bank",
    "Asian Development Bank (ADB)",
    "African Development Bank (AfDB)",
    "Inter-American Development Bank (IDB)",
    "United Nations Agencies",
    "UN Development Programme (UNDP)",
    "UN Environment Programme (UNEP)",
    "UNICEF",
    "WHO",
    "International Development Agencies",
    "USAID (United States)",
    "DFID (UK)",
    "GIZ (Germany)",
    "JICA (Japan)",
    "International Funds",
    "Green Climate Fund (GCF)",
    "Global Environment Facility (GEF)",
    "Global Fund for Health"
  ],
  "Private Sector and Corporate Entities": [
    "Corporate Social Responsibility (CSR)",
    "Philanthropic donations",
    "CSR initiatives tied to specific industries",
    "Private Investments",
    "Venture capital",
    "Angel investors",
    "Private equity funds",
    "Public-Private Partnerships (PPP)",
    "Build-Operate-Transfer (BOT) agreements",
    "Joint ventures",
    "Corporate Bonds and Securities",
    "Green bonds",
    "Infrastructure bonds",
    "Municipal bonds"
  ],
  "Financial Institutions": [
    "Commercial Banks",
    "Project financing loans",
    "Business loans",
    "Working capital facilities",
    "Development Banks",
    "National development banks",
    "Agricultural banks",
    "Microfinance Institutions",
    "Small-scale project financing",
    "Rural development loans",
    "Crowdfunding Platforms",
    "Online crowdfunding (Kickstarter, GoFundMe)",
    "Social impact funding platforms"
  ],
  "Community and Non-Governmental Sources": [
    "Non-Governmental Organizations (NGOs)",
    "Local NGOs",
    "International NGOs",
    "Community Contributions",
    "Cooperatives",
    "Self-help groups",
    "Voluntary contributions",
    "Philanthropic Organizations",
    "Charitable foundations",
    "Endowment funds",
    "Wealthy individuals (e.g., Bill & Melinda Gates Foundation)"
  ],
  "Income-Generating Activities": [
    "Project-Specific Revenue Streams",
    "User fees (e.g., tolls, park entry fees)",
    "Service charges (e.g., healthcare, utilities)",
    "Subscription models",
    "Asset Leasing or Sales",
    "Leasing project assets (e.g., land, equipment)",
    "Sale of by-products (e.g., waste recycling)",
    "Export Earnings",
    "Export of natural resources",
    "Sale of energy (e.g., power exports)"
  ],
  "Bilateral and Regional Partnerships": [
    "Foreign Direct Investment (FDI)",
    "Cross-border investments",
    "Industry-specific partnerships",
    "Regional Development Funds",
    "European Union Structural Funds",
    "ASEAN Infrastructure Fund",
    "African Union Programs",
    "Bilateral Agreements",
    "Country-to-country aid or loans",
    "Trade partnership funds"
  ],
  "Specialized Funds": [
    "Technology Funds",
    "IT innovation funds",
    "Artificial Intelligence research funds",
    "Environmental and Sustainability Funds",
    "Carbon credits/trading revenue",
    "Renewable energy subsidies",
    "Emergency and Relief Funds",
    "Disaster relief funding",
    "Humanitarian aid"
  ],
  "Innovative and Emerging Sources": [
    "Cryptocurrency and Blockchain-Based Funding",
    "Initial coin offerings (ICO)",
    "Decentralized finance (DeFi) grants",
    "Impact Investing",
    "Investments aimed at social/environmental impact",
    "Social Bonds",
    "Bonds for achieving social goals",
    "Gaming or Lottery Revenues",
    "State-run lotteries",
    "Charitable gaming revenues"
  ],
  "Other Miscellaneous Sources": [
    "Military or Defense Allocations",
    "Dual-use infrastructure",
    "Strategic reserves",
    "Special Donations or Legacies",
    "Wills and inheritance donations",
    "Historical bequests",
    "Cultural and Heritage Funding",
    "Heritage preservation taxes",
    "Cultural grants",
    "Personal income"
  ]
};

final Map<String, String> currencies = {
  "United States Dollar": "\$",
  "Euro": "€",
  "Nigerian Naira": "₦",
  "British Pound Sterling": "£",
  "Japanese Yen": "¥"
};

