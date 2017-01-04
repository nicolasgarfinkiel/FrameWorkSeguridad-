using System;
using System.ComponentModel;
using System.Web.Services;
using IRSA.Framework.Security;
using IRSA.Framework.Security.Model;
using IRSA.Framework.Security.Model.Collections;
using IRSA.Framework.Security.Transactions;
using IRSA.Framework.Security.UserData.Providers;

namespace IRSA.Framework.Services.WebServices
{
	[WebService(Description="Servicio centralizador de seguridad para aplicaciones.", Namespace="http://framework.irsa.com.ar/WebServices/Security/")]
	public class SecurityProvider : WebService
	{
		private SimpleSecurityTransaction trans;


		public SecurityProvider()
		{
			trans = new SimpleSecurityTransaction(User);

			//CODEGEN: This call is required by the ASP.NET Web Services Designer
			InitializeComponent();
		}

		#region Component Designer generated code

		//Required by the Web Services Designer 
		private IContainer components = null;


		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{

		}


		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose(bool disposing)
		{
			if (disposing && components != null)
				components.Dispose();
			base.Dispose(disposing);
		}

		#endregion

        #region AplicationProvider

        [WebMethod]
        public Application ApplicationGetItem(int idApplication)
        {
            trans.IdApplication = idApplication;
            return (ApplicationProvider.GetItem(idApplication, trans));
        }

        [WebMethod]
        public ApplicationCollection ApplicationList(Application application)
        {
            trans.IdApplication = application.Id;
            return (ApplicationProvider.List(application, trans));
        }

        #endregion

        #region UserProvider

        [WebMethod(BufferResponse=true,CacheDuration=60)]
		public User UserGetItem(int id, int idApplication)
		{
			trans.IdApplication = idApplication;
			return (UserProvider.GetItem(id, trans));
		}

        //[WebMethod(MessageName = @"Retorna un usuario por su UserName (Dominio\userName)")]
        //public User UserGetItem(string userName, int idApplication)
        //{           
        //  return UserDataProviderFactory.UserData().FillUserData(new User(userName));
        //}
      

		[WebMethod]
		public UserCollection UserList(User filter, int idApplication)
		{
			trans.IdApplication = idApplication;

			Group g = new Group();
			g.IdApplication = idApplication;

			return (UserProvider.List(filter, g, trans));
		}

 
		[WebMethod]
		public UserCollection UserListPerGroup(Group grupo)
		{
			trans.IdApplication = grupo.IdApplication;
			return (UserProvider.List(grupo, trans));
		}
        
    
        [WebMethod]
        public UserCollection UserListPerPermission(Permission permission)
        {
            trans.IdApplication = permission.IdApplication;
            return (UserProvider.List(permission, trans));
        }


		[WebMethod]
		public UserCollection UserListPerParameter(PermissionValue permissionvalue)
		{
			trans.IdApplication = permissionvalue.IdApplication;
			return (UserProvider.List(permissionvalue, trans));
		}


		[WebMethod]
		public bool UserIsInRole(User user, Group grupo)
		{
			trans.IdApplication = grupo.IdApplication;
			return (UserProvider.IsInRole(user, grupo, trans));
		}


		[WebMethod]
		public User UserLogon(int idApplication)
		{
			trans.IdApplication = idApplication;
			return (UserProvider.Logon(trans));
		}


		[WebMethod]
		public User UserLogonByName(string ntUserName, int idApplication)
		{
			User uinf = UserProvider.GetItem(UserProvider.Validate(ntUserName, trans), trans);
			trans.Usuario = uinf;
			trans.IdApplication = idApplication;
			return (UserProvider.Logon(uinf, trans));
		}


		[WebMethod]
		public void UserLogoff(int idApplication)
		{
			trans.IdApplication = idApplication;
			UserProvider.Logoff(trans);
		}


		[WebMethod]
		public bool UserCheckPermission(User user, Permission permission)
		{
			trans.IdApplication = permission.IdApplication;

			return (UserProvider.CheckPermission(user, permission, trans));
		}


		[WebMethod]
		public bool UserCheckParameter(User user, Permission permission,
		                               KeyValueItem parameter)
		{
			trans.IdApplication = permission.IdApplication;

			return (UserProvider.CheckParameter(user, permission, parameter, trans));
		}


		[WebMethod]
		public String[] GetUsersEmailByRol(string rol, string IdApplication)
		{

			Group grupo = new Group();
			grupo.IdApplication = Convert.ToInt32(IdApplication);
			grupo.Name = rol;
			GroupCollection grupos = this.GroupList(grupo);
			foreach (Group grp in grupos)
			{ 
				UserCollection users = this.UserListPerGroup(grp);
				String[] emails = new String[users.Count];
				int i = 0;
				foreach (User usr in users)
				{
					emails.SetValue(usr.Email, i);
					i++;
				}
				return emails;
			}

			return null;
		}


		#endregion

		#region PermissionProvider

		[WebMethod]
		public Permission PermissionGetItem(int id, int idApplication)
		{
			trans.IdApplication = idApplication;
			return (PermissionProvider.GetItem(id, trans));
		}


		[WebMethod]
		public PermissionCollection PermissionList(Permission filter)
		{
			trans.IdApplication = filter.IdApplication;
			return (PermissionProvider.List(filter, trans));
		}


		[WebMethod]
		public PermissionCollection PermissionListPerGroup(Group grupo)
		{
			trans.IdApplication = grupo.IdApplication;
			return (PermissionProvider.List(grupo, trans));
		}


		[WebMethod]
		public Permission PermissionSetItem(Permission permission)
		{
			trans.IdApplication = permission.IdApplication;
			return (PermissionProvider.SetItem(permission, trans));
		}


		[WebMethod]
		public void PermissionRemove(Permission permission)
		{
			trans.IdApplication = permission.IdApplication;
			PermissionProvider.Remove(permission.Id, trans);
		}

		#endregion

		#region PermissionParamProvider

		[WebMethod]
		public PermissionParam PermissionParamGetItem(Permission perm, string key)
		{
			trans.IdApplication = perm.IdApplication;
			return (PermissionParamProvider.GetItem(perm, key, trans));
		}


		[WebMethod]
		public PermissionParamCollection PermissionParamListPerPermission(Permission filter)
		{
			trans.IdApplication = filter.IdApplication;
			return (PermissionParamProvider.List(filter, trans));
		}


		[WebMethod]
		public PermissionParamCollection PermissionParamList(PermissionParam filter)
		{
			trans.IdApplication = filter.IdApplication;
			return (PermissionParamProvider.List(filter, trans));

		}


		[WebMethod]
		public PermissionParam PermissionParamSetItem(PermissionParam parameter)
		{
			trans.IdApplication = parameter.IdApplication;
			return (PermissionParamProvider.SetItem(parameter, trans));

		}


		[WebMethod]
		public PermissionParamCollection PermissionParamSetItems(PermissionParamCollection perparams)
		{
			if (perparams.Count > 0)
			{
				trans.IdApplication = perparams[0].IdApplication;
				return (PermissionParamProvider.SetItems(perparams, trans));
			}
			else
				return null;
		}


		[WebMethod]
		public void PermissionParamRemove(Permission perm, string key)
		{
			trans.IdApplication = perm.IdApplication;
			PermissionParamProvider.Remove(perm, key, trans);

		}

		#endregion

		#region PermissionValueProvider

		[WebMethod]
		public PermissionValue PermissionValueGetItem(Permission perm, Group group, string key, string value)
		{
			trans.IdApplication = perm.IdApplication;
			return (PermissionValueProvider.GetItem(perm, group, key, value, trans));
		}


		[WebMethod]
		public PermissionValueCollection PermissionValueList(PermissionValue filter)
		{
			trans.IdApplication = filter.IdApplication;
			return (PermissionValueProvider.List(filter, trans));
		}


		[WebMethod]
		public PermissionValue PermissionValueSetItem(PermissionValue pervalue)
		{
			trans.IdApplication = pervalue.IdApplication;
			return (PermissionValueProvider.SetItem(pervalue, trans));
		}


		[WebMethod]
		public PermissionValueCollection PermissionValueSetItems(PermissionValueCollection values)
		{
			if (values.Count > 0)
			{
				trans.IdApplication = values[0].IdApplication;
				return (PermissionValueProvider.SetItems(values, trans));
			}
			else
				return null;
		}


		[WebMethod]
		public void PermissionValueRemove(Permission perm, Group group, string key, string value)
		{
			trans.IdApplication = perm.IdApplication;
			PermissionValueProvider.Remove(perm, group, key, value, trans);
		}


		[Obsolete]
		[WebMethod]
		public PermissionValueCollection List(PermissionValue filter)
		{
			return (PermissionValueProvider.List(filter, trans));
		}

		#endregion

		#region GroupProvider

		[WebMethod]
		public Group GroupGetItem(int id, int idApplication)
		{
			trans.IdApplication = idApplication;
			return (GroupProvider.GetItem(id, trans));
		}


		[WebMethod]
		public GroupCollection GroupList(Group filter)
		{
			trans.IdApplication = filter.IdApplication;
			return (GroupProvider.List(filter, trans));
		}


		[WebMethod]
		public GroupCollection GroupsListPerPermission(Permission permission)
		{
			trans.IdApplication = permission.IdApplication;
			return (GroupProvider.List(permission, trans));
		}


        [WebMethod]
		public GroupCollection GroupsListPerUser(User user, int idApplication)
		{
			trans.IdApplication = idApplication;
			return (GroupProvider.List(user, trans));
		}

        [WebMethod]
        public GroupCollection GroupsListPerUserAllApp(User user)
        {
            trans.IdApplication = Int32.MinValue;
            return (GroupProvider.List(user, trans));
        }



		#endregion

		#region GroupPermissionProvider

		[WebMethod]
		public GroupPermission GroupPermissionSetItem(GroupPermission permission)
		{            
			this.trans.IdApplication = permission.Group.IdApplication;
			return GroupPermissionProvider.SetItem(permission, this.trans);
		}


		[WebMethod]
		public void GroupPermissionRemove(Group group, Permission perm)
		{
			this.trans.IdApplication = group.IdApplication;
			GroupPermissionProvider.Remove(group, perm, this.trans);
		}

		#endregion

        #region DelegationProvider

        /// <summary>
        /// Crea una delegacion con la información pasada por parámetro.
        /// </summary>
        /// <param name="delegation">Delegacion a crear</param>
        /// <returns>Delgacion creada. </returns>
        [WebMethod]
        public Delegation DelegationSetItem(Delegation delegation)
        {
            this.trans.IdApplication = delegation.UserGroup.Group.IdApplication;
            return DelegationProvider.SetItem(delegation, this.trans);
        }

        /// <summary>
        /// Retorna la delegacion cuyo id es el pasado por parámetro.
        /// </summary>
        /// <param name="id">Id de la delegación que se desea obtener.</param>
        /// <param name="idApplication">Aplicacion a la que pertenece la delegación.</param>
        /// <returns>Delegacion cuyo id es pasado por parámetro o null en caso de no existir.</returns>
        [WebMethod]
        public Delegation DelegationGetItem(int id, int idApplication)
        {
            trans.IdApplication = idApplication;
            return (DelegationProvider.GetItem(id, trans));            
        }
        
        /// <summary>
        /// Elimina la delegación pasada por parámetro.
        /// </summary>
        /// <param name="delegation">Delegacion a eliminar.</param>
        [WebMethod]
        public void DelegationRemove(Delegation delegation)
        {
            trans.IdApplication = delegation.IdApplication;
            DelegationProvider.Remove(delegation.Id, trans);
        }

        /// <summary>
        /// Retorna la lista de delegaciones que cumplen con el filtro pasado por parámetro.
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [WebMethod]
        public DelegationCollection DelegationList(Delegation filter,DateTime? fecha)
        {
            trans.IdApplication = filter.IdApplication;            
            return (DelegationProvider.List(filter,fecha, trans));
        }

        /// <summary>
        /// Retorna la lista de usuarios que tienen permiso sobre este grupo por delegación a la fecha de hoy.
        /// </summary>
        /// <param name="grupo">Grupo que deben tener delegados los permisos.</param>
        /// <returns>Coleccion de usuarios que tienen delegados los permisos del grupo 
        /// pasado por parámetro a la fecha.</returns>
        [WebMethod]
        public UserCollection UserListPerGroupOnlyDelegateToday(Group grupo)
        {
            return this.UserListPerGroupOnlyDelegate(grupo, DateTime.Now);
        }

        /// <summary>
        /// Retorna la lista de usuarios que tienen permiso sobre este grupo por delegación a la fecha pasada por parámetro.
        /// </summary>
        /// <param name="grupo">Grupo que deben tener delegados los permisos.</param>
        /// <returns>Coleccion de usuarios que tienen delegados los permisos del grupo 
        /// pasado por parámetro a la fecha pasada por parámetro.</returns>
        [WebMethod]
        public UserCollection UserListPerGroupOnlyDelegate(Group grupo,DateTime fecha)
        {
            trans.IdApplication = grupo.IdApplication;
            return (DelegationProvider.ListUsersPerGroup(grupo,fecha, trans));
        }

        /// <summary>
        /// Indica si el usuario pasado por parámetro esta en el grupo pasado por parámetro por delegacion.                
        /// </summary>
        /// <param name="user">Usuario a verificar si se encuentra en el grupo por delegacion.</param>
        /// <param name="grupo">Grupo a verificar si se encuentra el usuario por delegacion.</param>
        /// <param name="fecha">Fecha a verificar si se encuentra el usuario delegado.</param>
        /// <returns>
        /// TRUE  : EL usuario pertenece al grupo por delegacion para la fecha pasada por parámetro.
        /// FALSE : El usuario no pertenece al grupo por delegacion para la fecha pasada por parámetro.
        /// </returns>
        [WebMethod]
        public bool UserIsInDelegateRole(User user, Group grupo,DateTime fecha)
        {
            trans.IdApplication = grupo.IdApplication;
            return (DelegationProvider.IsInRole(user, grupo,fecha, trans));         
        }

        /// <summary>
        /// Indica si el usuario pasado por parámetro esta en el grupo pasado por parámetro por delegacion
        /// para la fecha del dia de hoy.
        /// </summary>
        /// <param name="user">Usuario a verificar si se encuentra en el grupo por delegacion.</param>
        /// <param name="grupo">Grupo a verificar si se encuentra el usuario por delegacion.</param>        
        /// <returns>
        /// TRUE  : EL usuario pertenece al grupo por delegacion para la fecha del día de hoy.
        /// FALSE : El usuario no pertenece al grupo por delegacion para la fecha del día de hoy.
        /// </returns>        
        [WebMethod]
        public bool UserIsInDelegateRoleToday(User user, Group grupo)
        {
            return this.UserIsInDelegateRole(user, grupo, DateTime.Now);
        }

        /// <summary>
        /// Retorna todos los grupos al que el usuario perteneces por delegacion.
        /// </summary>
        /// <param name="user">Usuario al que perteneceran los grupos.</param>
        /// <param name="idApplication">Aplicacion a la que deben pertenecer los grupos.</param>
        /// <returns>
        /// Coleccion de grupos a los que pertenece el usuario para la aplicacion pasada por parámetro.
        /// </returns>
        [WebMethod]
        public GroupCollection GroupsListPerUserOnlyDelegate(User user,DateTime fecha, int idApplication)
        {
            trans.IdApplication = idApplication;
            return (DelegationProvider.ListGroupsPerUser(user,fecha, trans));
        }

        /// <summary>
        /// Obtiene los grupos que el usuario tiene asignados por delegacion para la aplicación pasada
        /// por parámetro.
        /// </summary>
        /// <param name="user"> Usuario a obtener los grupos de permiso que tiene por delegación. </param>
        /// <param name="idApplication"> Aplicacion a obtener los grupos.</param>
        /// <returns> Colecion de grupos que tiene delegados el usuario pasado por parámetro
        /// para la aplicación pasada por parámetro. </returns>
        [WebMethod]
        public GroupCollection GroupsListPerUserOnlyDelegateToday(User user, int idApplication)
        {
            return this.GroupsListPerUserOnlyDelegate(user, DateTime.Now, idApplication);
        }

        #endregion

        #region Permisos Propios o Delegados

        [WebMethod]
        public UserCollection AllUserListPerGroup(Group grupo)
        {
            return this.AllUserListPerGroupAtDate(grupo, DateTime.Now);
        }

        [WebMethod]
        public UserCollection AllUserListPerGroupAtDate(Group grupo,DateTime fecha)
        {
            UserCollection usersCollection = this.UserListPerGroup(grupo);
            UserCollection usersCollectionDelagated = this.UserListPerGroupOnlyDelegate(grupo,fecha);

            foreach (User user in usersCollectionDelagated)
            {
                usersCollection.Add(user);
            }

            return usersCollection;
        }

        /// <summary>
        /// Indica si el usuario pasado por parámetro pertenece al grupo 
        /// pasado por parámetro. Tiene en cuenta roles propios y los roles delegados.
        /// La fecha para los roles es la fecha del día de la fecha.
        /// </summary>
        /// <param name="user">Usuario a verificar si pertenece al grupo pasado por parámetro.</param>
        /// <param name="grupo">Grupo a verificar si se encuentra el usuario.</param>
        /// <returns>
        ///  TRUE: EL usuario pertenece al grupo pasado por parámetro ya sea por permiso propio o por delegación.
        ///  FALSE: El usuario no tiene el rol ni propio ni delegado.
        /// </returns>
        [WebMethod]
        public bool IsUserInRol(User user, Group grupo)
        {
            return this.IsUserInRolAtDate(user, grupo, DateTime.Now);
        }

        /// <summary>
        /// Indica si el usuario pasado por parámetro pertenece al grupo 
        /// pasado por parámetro. Tiene en cuenta roles propios y los roles delegados.
        /// La fecha para los roles es la fecha pasada por parámetro.
        /// </summary>
        /// <param name="user">Usuario a verificar si pertenece al grupo pasado por parámetro.</param>
        /// <param name="grupo">Grupo a verificar si se encuentra el usuario.</param>
        /// <returns>
        ///  TRUE: EL usuario pertenece al grupo pasado por parámetro ya sea por permiso propio o por delegación.
        ///  FALSE: El usuario no tiene el rol ni propio ni delegado.
        /// </returns>
        [WebMethod]
        public bool IsUserInRolAtDate(User user, Group grupo,DateTime fecha)
        {
            bool isInRol = this.UserIsInRole(user, grupo);

            if (!isInRol)
            {
                isInRol = this.UserIsInDelegateRole(user, grupo, fecha);
            }

            return isInRol;
        }

        [WebMethod]
        public GroupCollection AllGroupsListPerUser(User user, int idApplication)
        {
            return this.AllGroupsListPerUserAtDate(user, DateTime.Now, idApplication);
        }

        [WebMethod]
        public GroupCollection AllGroupsListPerUserAtDate(User user, DateTime fecha, int idApplication)
        {
            GroupCollection groupsCollection = this.GroupsListPerUser(user,idApplication);
            GroupCollection groupsCollectionDelagated = this.GroupsListPerUserOnlyDelegate(user, fecha,idApplication);

            foreach (Group group in groupsCollectionDelagated)
            {
                groupsCollection.Add(group);
            }

            return groupsCollection;
        }

        #endregion
    }
}