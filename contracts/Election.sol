pragma solidity ^0.5.0;

contract Election {
    address public owner;
    address public admin;
    address public operator;

    struct Candidate {
        uint id;
        string gid;
        string name;
        string title;
        string affiliation;
        uint gender;
        string country;
        string picurl;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;
    uint256 public openingTime;
    uint256 public closingTime;

    modifier onlyOwner {
        require(msg.sender == owner, "Must be owner address.");
        _;
    }

    modifier onlyAdmin {
        require(msg.sender == admin, "Must be administrator address.");
        _;
    }

    modifier onlyOperator {
        require(msg.sender == operator, "Must be operator address.");
        _;
    }

    function setAdmin(address newAdmin) external onlyOwner {
        require(newAdmin != address(0), "The administrator cannot set to empty.");
        admin = newAdmin;
    }

    function setOperator(address newOperator) external onlyAdmin {
        require(newOperator != address(0), "The operator cannot set to empty.");
        operator = newOperator;
    }

    modifier onlyWhileOpening {
        require(isOpening(), "This vote is closed.");
        _;
    }

    function isOpening() public view returns (bool) {
        /* solium-disable-next-line */
        return block.timestamp >= openingTime && block.timestamp <= closingTime;
    }

    function hasClosed() public view returns (bool) {
        /* solium-disable-next-line */
        return block.timestamp > closingTime;
    }

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    /**
     * @dev Constructor, takes vote opening and closing times, and contract owner.
     */
    constructor() public {
        owner = msg.sender;

         /* solium-disable-next-line */
        openingTime = now;

         /* solium-disable-next-line */
        closingTime = block.timestamp + 3650 days;
    }

    function addDefaultCandidates() public onlyOwner {
        addCandidate("100001", "Theo Epstein", "President", "Baseball Operations, Chicago Cubs", 1, "US", "100001.png");
        addCandidate("100002", "Jack Ma", "Executive Chairman", "Alibaba Group", 1, "CN", "100002.png"); 
        addCandidate("100003", "Pope Francis ", "Head of the Roman Catholic Church", "", 1, "US", "100003.png");        
        addCandidate("100004", "Melinda Gates", "Cochair", "Bill & Melinda Gates Foundation", 0, "US", "100004.png");
        addCandidate("100005", "Jeff Bezos", "Founder and CEO", "Amazon", 1, "US", "100005.png");
        addCandidate("100006", "Ava DuVernay", "Film Director and Screenwriter", "", 0, "US", "100006.png"); 
        addCandidate("100007", "H.R. McMaster", "U.S. National Security Adviser", "", 1, "US", "100007.png");
        addCandidate("100008", "Tsai Ing-Wen", "Governor", "Taiwan", 0, "CN", "100008.png");
        addCandidate("100009", "John McCain", "U.S Senator", "Arizona", 1, "US", "100009.png");
        addCandidate("100010", "Angela Merkel", "Chancellor", "Germany", 0, "DE", "100010.png");
        addCandidate("100011", "LeBron James ", "Small Forward", "Cleveland Cavaliers", 1, "US", "100011.png");
        addCandidate("100012", "John Kasich", "Governor", "Ohio", 1, "US", "100012.png"); 
        addCandidate("100013", "John Delaney", "U.S. Representative", "Maryland", 1, "US", "100013.png");
        addCandidate("100014", "Helle Thorning-Schmidt", "CEO", "Save the Children International", 0, "US", "100014.png");
        addCandidate("100015", "Katharine Hayhoe", "Director", "Climate Science Center, TexasTech", 0, "GB", "100015.png");
        addCandidate("100016", "Bryan Stevenson", "Executive Director", "Equal Justice Initiative", 1, "CN", "100016.png");
        addCandidate("100017", "Janet Yellen", "Chair", "Federal Reserve", 0, "JP", "100017.png");		
        addCandidate("100018", "Brian Chesky", "CEO and Head of Community", "Airbnb", 1, "US", "100018.png");
        addCandidate("100019", "Samantha Bee ", "Host and Executive Producer", "Full Frontal", 0, "US", "100019.png");
        addCandidate("100020", "Paul Polman", "CEO", "Unilever", 1, "US", "100020.png");
        addCandidate("100021", "John Roberts", "Chief Justice", "U.S. Supreme Court", 1, "US", "100021.png");
        addCandidate("100022", "Janeé Harteau", "Chief of Police", "Minneapolis", 0, "US", "100022.png");
        addCandidate("100023", "Joe Biden ", "Former", "U.S. Vice President", 1, "US", "100023.png");
        addCandidate("100024", "Zhang Ruimin", "CEO", "Haier Group", 1, "CN", "100024.png");
        addCandidate("100025", "Carmen Aristegui", "Host and Reporter", "Aristegui Noticias", 0, "MX", "100025.png");
        addCandidate("100026", "Arundhati Bhattacharya", "Chairman", "State Bank of India", 0, "IN", "100026.png");
        addCandidate("100027", "Shakira", "Singer", "", 0, "US", "100027.png");
        addCandidate("100028", "Raj Panjabi ", "CEO", "Last Mile Health", 1, "US", "100028.png");
        addCandidate("100029", "Svetlana Gannushkina", "Founder", "Citizens Assistance Committee", 0, "RU", "100029.png");
        addCandidate("100030", "Elon Musk", "CEO", "Tesla and SpaceX", 1, "US", "100030.png");
        addCandidate("100031", "Justin Trudeau ", "Prime Minister", "Canada", 1, "CA", "100031.png");
        addCandidate("100032", "Rebecca Richards-Kortum ", "Professor", "Rice University", 0, "US", "100032.png");
    }

    /* solium-disable-next-line */
    function addCandidate (string memory gid, string memory name, string memory title, string memory affiliation, uint gender, string memory country, string memory picurl) public onlyOwner {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, gid, name, title, affiliation, gender, country, picurl, 0);
    }

    function vote (uint candidateId) public onlyWhileOpening {
        // require that they haven't voted before
        require(!voters[msg.sender], "You already voted");

        // require a valid candidate
        require(candidateId > 0 && candidateId <= candidatesCount, "Please vote to a valid candidate!");

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[candidateId].voteCount ++;

        // trigger voted event
        emit votedEvent(candidateId);
    }

    function stringToBytes32(string memory source) public pure returns(bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        /* solium-disable-next-line */
        assembly {
            result:= mload(add(source, 32))
        }
    }
}