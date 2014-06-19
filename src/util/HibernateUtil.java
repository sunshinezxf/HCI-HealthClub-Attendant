package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	@SuppressWarnings("deprecation")
	private static SessionFactory sessionFactory = new Configuration()
			.configure().buildSessionFactory();

	public static Session openSession() {
		Session session = sessionFactory.openSession();
		return session;
	}

	public static void closeSession(Session session) {
		if (session != null) {
			session.close();
		}
	}
}
