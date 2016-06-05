import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;
import oracle.kv.ValueVersion;
import java.util.ArrayList;

class LoadData
{
	private static KVStore store;
	
	private static void addKeyPair(Key key, String... dbValues)
	{
		String valueString = dbValues[0];

		for (int i = 1; i < dbValues.length; i++) {
			valueString += ("," + dbValues[i]);
		}

		Value value = Value.createValue(valueString.getBytes());
		store.put(key, value);
	}
	
	private static void addApplicant(String applicantNumber, String... dbValues)
	{
		ArrayList<String> majorList = new ArrayList<String>();
		majorList.add("applicant");
		majorList.add(applicantNumber);
		Key key = Key.createKey(majorList);
		addKeyPair(key, dbValues);
	}
	
	private static void addSPossessed(String applicantNumber, String lastName, String... dbValues)
	{
		ArrayList<String> majorList = new ArrayList<String>();
		majorList.add("spossessed");
		majorList.add(applicantNumber);
		majorList.add(lastName);
		Key key = Key.createKey(majorList);
		addKeyPair(key, dbValues);
	}
	
	private static void addPosition(String positionNumber, String... dbValues)
	{
		ArrayList<String> majorList = new ArrayList<String>();
		majorList.add("position");
		majorList.add(positionNumber);
		Key key = Key.createKey(majorList);
		addKeyPair(key, dbValues);
	}
	
	private static void addSNeeded(String positionNumber, String lastName, String value)
	{
		ArrayList<String> majorList = new ArrayList<String>();
		majorList.add("sneeded");
		majorList.add(positionNumber);
		majorList.add(lastName);
		Key key = Key.createKey(majorList);
		addKeyPair(key, value);
	}
	
	private static void addApplies(String applicantNumber, String positionNumber, String value)
	{
		ArrayList<String> majorList = new ArrayList<String>();
		majorList.add("applies");
		majorList.add(applicantNumber);
		majorList.add(positionNumber);
		Key key = Key.createKey(majorList);
		addKeyPair(key, value);
	}
	
    public static void main(String args[])
    {
        try {
		
			String storeName = "kvstore";
			String hostName = "localhost";
			String hostPort = "5000";
								
			store = KVStoreFactory.getStore(new KVStoreConfig(storeName, hostName + ":" + hostPort));
            
			System.out.println("Connection Opened: " + hostName + ":" + hostPort);
			
			addSPossessed("000001", "JAVA PROGRAMMING", "9");
			addSPossessed("000002", "C PROGRAMMING", "5");
			addSPossessed("000002", "JAVA PROGRAMMING", "9");
			addSPossessed("000002", "TRUCK DRIVING", "6");

			addSNeeded("00000001", "JAVA PROGRAMMING", "8" );
			addSNeeded("00000001", "C PROGRAMMING", "4" );
			addSNeeded("00000002", "JAVA PROGRAMMING", "8" );
			addSNeeded("00000002", "C PROGRAMMING", "4" );

			addApplicant("000001", "PETER", "JONES", "7 STATION ST.", "PERTH", 
				"WA", "645278453", "", "", 
				"Job expectations ? Money, money, money, ...");
			addApplicant("000002", "JOHN", "BLACK", "23 VICTORIA ST.", "GEELONG", 
				"Vic", "63569784", "63569785", "blunder@hotmail.com", 
				"Microsoft Access ? Oh yeah, kindergarten database system" );
			addPosition("00000001", "LECTURER", "UNSW", "45000.00", 
				"computer", "Teaching");
			addPosition("00000002", "LECTURER", "UOW", "450000.00", 
				"mouse pad", "Research");
			
			addApplies("000001", "00000001", "13-DEC-1999" );
			addApplies("000002", "00000002", "13-DEC-1999" );
			
            store.close();
			System.out.println("Connection Closed: " + hostName + ":" + hostPort);
        } catch (RuntimeException e) {
            e.printStackTrace();
        }
    }
}
